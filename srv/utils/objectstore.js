import cds from "@sap/cds";
import fs from "node:fs/promises";
import path from "node:path";
import { BlobServiceClient, ContainerClient } from "@azure/storage-blob";

const LOG = cds.log();

function _findBoundObjectStoreCredentials(serviceName) {
  const vcap = _readVcapServices();

  // 1) Try exact instance name match across all service groups
  if (serviceName) {
    for (const entries of Object.values(vcap)) {
      if (!Array.isArray(entries)) continue;
      const matchByName = entries.find((entry) => entry?.name === serviceName);
      if (matchByName?.credentials) return matchByName.credentials;
    }
  }

  return undefined;
}

function _readObjectStoreCredentials() {
  const serviceName = process.env.OBJECTSTORE_SERVICE_NAME || "azureobjectstore";
  const creds = _findBoundObjectStoreCredentials(serviceName) || {};

  return {
    accountUrl: creds.container_uri || process.env.AZURE_STORAGE_ACCOUNT_URL,
    sasToken: creds.sas_token || process.env.AZURE_STORAGE_SAS_TOKEN,
    container: creds.container_name || process.env.OBJECTSTORE_CONTAINER,
  };
}

function _normalizeSasToken(sasToken) {
  return String(sasToken || "").replace(/^\?+/, "");
}

function _createContainerClient(c) {
  const accountUrl = String(c.accountUrl || "").trim();
  const sasToken = _normalizeSasToken(c.sasToken);
  const container = String(c.container || "").trim();

  if (!accountUrl || !sasToken) {
    throw new Error("Azure Blob credentials are missing. Provide container_uri/account URL and sas_token.");
  }

  const parsedUrl = new URL(accountUrl);
  const pathSegments = parsedUrl.pathname.split("/").filter(Boolean);

  if (pathSegments.length > 0) {
    return new ContainerClient(`${accountUrl}?${sasToken}`);
  }

  if (!container) {
    throw new Error("Azure Blob container name is missing. Provide container_name or OBJECTSTORE_CONTAINER.");
  }

  return new BlobServiceClient(`${accountUrl}?${sasToken}`).getContainerClient(container);
}


function _readVcapServices() {
  try {
    return JSON.parse(process.env.VCAP_SERVICES || "{}");
  } catch {
    return {};
  }
}

async function uploadFileToObjectStore(localFilePath, options = {}) {
  const key = options.objectKey || `${process.env.OBJECTSTORE_PREFIX || "llm-reports"}/${path.basename(localFilePath)}`;
  const body = await fs.readFile(localFilePath);
  return uploadBufferToObjectStore(body, { ...options, objectKey: key });
}

async function uploadBufferToObjectStore(body, options = {}) {
  const key = options.objectKey;
  if (!key) throw new Error("An object key is required to upload a report buffer.");
  const c = _readObjectStoreCredentials();
  const container = _createContainerClient(c);

  await container.getBlockBlobClient(key).uploadData(body, {
    blobHTTPHeaders: { blobContentType: options.contentType || "application/vnd.openxmlformats-officedocument.wordprocessingml.document" }
  });
  return { bucket: c.container, key };
}

async function listObjectStoreKeys(options = {}) {
  const c = _readObjectStoreCredentials();
  const container = _createContainerClient(c);

  const prefix = (options.prefix || process.env.OBJECTSTORE_PREFIX || "llm-reports").replace(/\/?$/, "/");
  const suffix = options.suffix || ".docx";
  const keys = [];
  for await (const b of container.listBlobsFlat({ prefix })) if (b.name.endsWith(suffix)) keys.push(b.name);
  return { bucket: c.container, keys, prefix };
}

async function downloadObjectFromObjectStore(key) {
  const c = _readObjectStoreCredentials();
  const container = _createContainerClient(c);
  const blobClient = container.getBlobClient(key);
  const download = await blobClient.download();
  const chunks = [];
  for await (const chunk of download.readableStreamBody) chunks.push(Buffer.from(chunk));
  const props = await blobClient.getProperties();
  return { bucket: c.container, key, contentType: props.contentType, content: Buffer.concat(chunks) };
}

async function clearObjectStorePrefix(prefix = process.env.OBJECTSTORE_PREFIX || "llm-reports") {
  const c = _readObjectStoreCredentials();
  const container = _createContainerClient(c);

  const normalized = prefix.replace(/\/?$/, "/");
  let deletedCount = 0;
  for await (const b of container.listBlobsFlat({ prefix: normalized })) {
    await container.deleteBlob(b.name);
    deletedCount++;
  }
  return { bucket: c.container, prefix: normalized, deletedCount };
}


export {
  clearObjectStorePrefix,
  downloadObjectFromObjectStore,
  listObjectStoreKeys,
  uploadBufferToObjectStore,
  uploadFileToObjectStore,
};
