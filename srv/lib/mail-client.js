import cds from '@sap/cds';
import {
  toDestinationNameUrl,
  useOrFetchDestination
} from '@sap-cloud-sdk/connectivity';
import nodemailer from 'nodemailer';
import { SocksClient } from 'socks';
import {
  customAuthRequestHandler,
  customAuthResponseHandler
} from './socket-proxy.js';

const LOG = cds.log('mail-client');

function buildMailDestination(destination) {
  const originalProperties = destination.originalProperties;
  if (!originalProperties) {
    throw Error(
      `The destination '${toDestinationNameUrl(destination)}' does not contain any properties.`
    );
  }

  const { host, port } = getHostAndPort(destination, originalProperties);
  const { username, password } = getOptionalCredentials(originalProperties);
  const smtpOptions = getOptionalSmtpOptions(originalProperties);
  const from = originalProperties['mail.smtp.from'];

  return {
    ...destination,
    host,
    port,
    username,
    password,
    ...smtpOptions,
    from
  };
}

function getHostAndPort(destination, originalProperties) {
  const host = originalProperties['mail.smtp.host'];
  const port = originalProperties['mail.smtp.port'];

  if (!(host && port)) {
    throw Error(
      `The destination '${toDestinationNameUrl(destination)}' does not contain host or port information as properties. Please configure in the "Additional Properties" of the destination.`
    );
  }

  return { host, port: parseInt(port, 10) };
}

function getOptionalCredentials(originalProperties) {
  const username = originalProperties['mail.user'];
  const password = originalProperties['mail.password'];

  if ((username && !password) || (!username && password)) {
    throw Error(
      'Both destination properties "mail.user" and "mail.password" must be provided together, or both omitted for anonymous SMTP.'
    );
  }

  return {
    username,
    password
  };
}

function getOptionalSmtpOptions(originalProperties) {
  const secure = parseOptionalBooleanProperty(
    originalProperties['mail.smtp.secure'],
    'mail.smtp.secure'
  );

  const ignoreTLS = parseOptionalBooleanProperty(
    originalProperties['mail.smtp.ignoreTLS'],
    'mail.smtp.ignoreTLS'
  );
  const requireTLS = parseOptionalBooleanProperty(
    originalProperties['mail.smtp.requireTLS'],
    'mail.smtp.requireTLS'
  );
  const tlsServername = originalProperties['mail.smtp.tls.servername'];
  const tlsRejectUnauthorized = parseOptionalBooleanProperty(
    originalProperties['mail.smtp.tls.rejectUnauthorized'],
    'mail.smtp.tls.rejectUnauthorized'
  );
  const connectionTimeout = parseOptionalNumberProperty(
    originalProperties['mail.smtp.connectionTimeout'],
    'mail.smtp.connectionTimeout'
  );
  const greetingTimeout = parseOptionalNumberProperty(
    originalProperties['mail.smtp.greetingTimeout'],
    'mail.smtp.greetingTimeout'
  );
  const socketTimeout = parseOptionalNumberProperty(
    originalProperties['mail.smtp.socketTimeout'],
    'mail.smtp.socketTimeout'
  );
  const dnsTimeout = parseOptionalNumberProperty(
    originalProperties['mail.smtp.dnsTimeout'],
    'mail.smtp.dnsTimeout'
  );

  const smtpOptions = {};

  if (typeof secure === 'boolean') {
    smtpOptions.secure = secure;
  }

  if (typeof ignoreTLS === 'boolean') {
    smtpOptions.ignoreTLS = ignoreTLS;
  }

  if (typeof requireTLS === 'boolean') {
    smtpOptions.requireTLS = requireTLS;
  }

  if (tlsServername || typeof tlsRejectUnauthorized === 'boolean') {
    smtpOptions.tls = {};

    if (tlsServername) {
      smtpOptions.tls.servername = tlsServername;
    }

    if (typeof tlsRejectUnauthorized === 'boolean') {
      smtpOptions.tls.rejectUnauthorized = tlsRejectUnauthorized;
    }
  }

  if (typeof connectionTimeout === 'number') {
    smtpOptions.connectionTimeout = connectionTimeout;
  }

  if (typeof greetingTimeout === 'number') {
    smtpOptions.greetingTimeout = greetingTimeout;
  }

  if (typeof socketTimeout === 'number') {
    smtpOptions.socketTimeout = socketTimeout;
  }

  if (typeof dnsTimeout === 'number') {
    smtpOptions.dnsTimeout = dnsTimeout;
  }

  return smtpOptions;
}

function parseOptionalNumberProperty(rawValue, propertyName) {
  if (rawValue === undefined || rawValue === null || rawValue === '') {
    return undefined;
  }

  const parsedValue = Number(rawValue);
  if (!Number.isFinite(parsedValue) || parsedValue < 0) {
    throw Error(
      `Destination property '${propertyName}' must be a non-negative number.`
    );
  }

  return parsedValue;
}

function parseOptionalBooleanProperty(rawValue, propertyName) {
  if (rawValue === undefined || rawValue === null || rawValue === '') {
    return undefined;
  }

  if (typeof rawValue === 'boolean') {
    return rawValue;
  }

  const normalized = String(rawValue).trim().toLowerCase();
  if (['true', '1', 'yes'].includes(normalized)) {
    return true;
  }
  if (['false', '0', 'no'].includes(normalized)) {
    return false;
  }

  throw Error(
    `Destination property '${propertyName}' must be a boolean value (true/false).`
  );
}

function buildSocksProxy(mailDestination) {
  if (!mailDestination.proxyConfiguration) {
    throw Error(
      'The proxy configuration is undefined, which is mandatory for creating a socket connection.'
    );
  }

  const proxyAuthorization =
    mailDestination.proxyConfiguration['proxy-authorization'];
  if (!proxyAuthorization) {
    throw Error(
      'The proxy authorization is undefined, which is mandatory for creating a socket connection.'
    );
  }

  const proxyJwt = extractJwtFromProxyAuthorization(proxyAuthorization);

  if (!mailDestination.cloudConnectorLocationId) {
    LOG.debug(
      'The Cloud Connector locationID is undefined. The default Cloud Connector of the subaccount will be used.'
    );
  }

  return {
    host: mailDestination.proxyConfiguration.host,
    port: mailDestination.proxyConfiguration.port,
    type: 5,
    custom_auth_method: 0x80,
    custom_auth_request_handler: () =>
      customAuthRequestHandler(
        proxyJwt,
        mailDestination.cloudConnectorLocationId
      ),
    custom_auth_response_size: 2,
    custom_auth_response_handler: customAuthResponseHandler
  };
}

function extractJwtFromProxyAuthorization(proxyAuthorization) {
  const bearerPrefix = /^Bearer\s+/i;
  return bearerPrefix.test(proxyAuthorization)
    ? proxyAuthorization.replace(bearerPrefix, '').trim()
    : proxyAuthorization;
}

function buildSocksProxyUrl(mailDestination) {
  if (!mailDestination.proxyConfiguration) {
    throw Error(
      'The proxy configuration is undefined, which is mandatory for creating a socket connection.'
    );
  }

  return `socks5://${mailDestination.proxyConfiguration.host}:${mailDestination.proxyConfiguration.port}`;
}

async function createSocket(mailDestination) {
  const connectionOptions = {
    proxy: buildSocksProxy(mailDestination),
    command: 'connect',
    destination: {
      host: mailDestination.host,
      port: mailDestination.port
    }
  };

  try {
    const { socket } = await SocksClient.createConnection(connectionOptions);
    return socket;
  } catch (error) {
    throw createSocksConnectionError(error, mailDestination);
  }
}

function createSocksConnectionError(error, mailDestination) {
  const cloudConnectorLocationId = mailDestination.cloudConnectorLocationId
    ? ` and Cloud Connector location ID '${mailDestination.cloudConnectorLocationId}'`
    : '';

  const details = [
    `SOCKS connection failed for ${mailDestination.host}:${mailDestination.port} via ${mailDestination.proxyConfiguration.host}:${mailDestination.proxyConfiguration.port}${cloudConnectorLocationId}.`,
    'Check Cloud Connector TCP Access Control for the virtual host/port mapping and ensure the backend is reachable from Cloud Connector.',
    'Also verify destination additional properties mail.smtp.host/mail.smtp.port and (if used) cloudConnectorLocationId.'
  ].join(' ');

  const wrappedError = new Error(`${details} Root cause: ${error.message}`);
  wrappedError.cause = error;
  return wrappedError;
}

function createTransport(mailDestination, mailClientOptions) {
  const baseOptions = {
    pool: true,
    host: mailDestination.host,
    port: mailDestination.port
  };

  if (typeof mailDestination.secure === 'boolean') {
    baseOptions.secure = mailDestination.secure;
  }

  if (typeof mailDestination.ignoreTLS === 'boolean') {
    baseOptions.ignoreTLS = mailDestination.ignoreTLS;
  }

  if (typeof mailDestination.requireTLS === 'boolean') {
    baseOptions.requireTLS = mailDestination.requireTLS;
  }

  if (mailDestination.tls) {
    baseOptions.tls = mailDestination.tls;
  }

  if (mailDestination.username && mailDestination.password) {
    baseOptions.auth = {
      user: mailDestination.username,
      pass: mailDestination.password
    };
  }

  if (mailDestination.proxyType === 'OnPremise') {
    mailClientOptions = {
      ...(mailClientOptions || {}),
      proxy: buildSocksProxyUrl(mailDestination)
    };
  }

  return nodemailer.createTransport({
    ...baseOptions,
    ...mailClientOptions
  });
}

function buildMailConfigsFromDestination(mailDestination) {
  return { from: mailDestination.from };
}

async function sendMailInSequential(
  transport,
  mailConfigsFromDestination,
  mailConfigs
) {
  const response = [];

  for (const [mailConfigIndex, mailConfig] of mailConfigs.entries()) {
    try {
      response[mailConfigIndex] = await transport.sendMail({
        ...mailConfigsFromDestination,
        ...mailConfig
      });
    } catch (error) {
      LOG.error(
        `Failed to send email ${mailConfigIndex + 1}/${mailConfigs.length} with subject "${mailConfig.subject}". Error: ${error.message}`
      );
      response[mailConfigIndex] = {
        response: error.response,
        rejected: error.rejected
      };
    }
  }

  return response;
}

async function sendMailInParallel(
  transport,
  mailConfigsFromDestination,
  mailConfigs
) {
  return Promise.all(
    mailConfigs.map(async (mailConfig, mailConfigIndex) => {
      try {
        return await transport.sendMail({
          ...mailConfigsFromDestination,
          ...mailConfig
        });
      } catch (error) {
        LOG.error(
          `Failed to send email ${mailConfigIndex + 1}/${mailConfigs.length} with subject "${mailConfig.subject}". Error: ${error.message}`
        );
        return {
          response: error.response,
          rejected: error.rejected
        };
      }
    })
  );
}

async function sendMailWithNodemailer(
  mailDestination,
  mailConfigs,
  mailClientOptions
) {
  let socket;
  const transport = createTransport(mailDestination, mailClientOptions);

  transport.set('proxy_handler_socks5', async (_, __, callback) => {
    try {
      socket = await createSocket(mailDestination);
      callback(null, { connection: socket });
    } catch (error) {
      LOG.error(
        `SOCKS connection failed for ${mailDestination.host}:${mailDestination.port}. ${error.message}`
      );
      callback(error);
    }
  });

  try {
    const mailConfigsFromDestination =
      buildMailConfigsFromDestination(mailDestination);

    return isMailSentInSequential(mailClientOptions)
      ? await sendMailInSequential(
        transport,
        mailConfigsFromDestination,
        mailConfigs
      )
      : await sendMailInParallel(
        transport,
        mailConfigsFromDestination,
        mailConfigs
      );
  } finally {
    transport.close();
    if (socket) {
      socket.end();
      socket.destroy();
    }
  }
}

async function sendMail(destination, mailConfigs, mailClientOptions) {
  const resolvedDestination = await useOrFetchDestination(destination);
  if (!resolvedDestination) {
    throw Error(`Destination '${toDestinationNameUrl(destination)}' could not be resolved.`);
  }

  if (!!resolvedDestination.type && resolvedDestination.type !== 'MAIL') {
    throw Error(
      `The type of the destination '${toDestinationNameUrl(destination)}' has to be 'MAIL', but is '${resolvedDestination.type}'.`
    );
  }

  const mailDestination = buildMailDestination(resolvedDestination);

  return sendMailWithNodemailer(
    mailDestination,
    transformToArray(mailConfigs),
    mailClientOptions
  );
}

function transformToArray(singleElementOrArray) {
  return Array.isArray(singleElementOrArray)
    ? singleElementOrArray
    : [singleElementOrArray];
}

function isMailSentInSequential(mailClientOptions) {
  return mailClientOptions?.sdkOptions?.parallel === false;
}

export {
  sendMail,
  buildSocksProxy,
  buildSocksProxyUrl,
  isMailSentInSequential
};
