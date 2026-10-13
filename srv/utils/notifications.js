import cds from "@sap/cds";
import fs from "node:fs/promises";
import path from "node:path";
import { sendMail } from "../lib/mail-client.js";

const LOG = cds.log();

async function _createSmtpContext() {
  const destinationName = process.env.EMAIL_DESTINATION || "wbg_lmail";
  const to = process.env.EMAIL_TO || "mchandradas@worldbankgroup.org";
  if (!destinationName || !to) {
    LOG.info(
      "Skipping email send. Configure EMAIL_DESTINATION and EMAIL_TO to enable startup email.",
    );
    return null;
  }

  const recipients = to
    .split(",")
    .map((x) => x.trim())
    .filter(Boolean);

  return {
    destinationName,
    recipients,
  };
}

async function emailDocxViaDestination(docxFilePath) {
  const smtpContext = await _createSmtpContext();
  if (!smtpContext) return;

  const { destinationName, recipients } = smtpContext;
  const subject = process.env.EMAIL_SUBJECT || "ABAP LLM Review Report";
  const body =
    process.env.EMAIL_BODY ||
    "Please find the generated ABAP review report attached.";
  const from = process.env.EMAIL_FROM;

  const fileBuffer = await fs.readFile(docxFilePath);

  await sendMail(
    { destinationName },
    {
      ...(from ? { from } : {}),
      to: recipients,
      subject,
      text: body,
      attachments: [
        {
          filename: path.basename(docxFilePath),
          content: fileBuffer,
          contentType:
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        },
      ],
    },
  );

  LOG.info(
    `Sent DOCX report email via MAIL destination '${destinationName}' to ${recipients.join(", ")}`,
  );
}

async function emailDocxAttachmentsViaDestination(attachments, options = {}) {

  const smtpContext = await _createSmtpContext();
  if (!smtpContext) return;
  if (!Array.isArray(attachments) || !attachments.length) {
    LOG.info("Skipping email send because no attachments were provided.");
    return;
  }

  const { destinationName, recipients } = smtpContext;
  const effectiveRecipients = Array.isArray(options.overrideRecipients) && options.overrideRecipients.length
    ? options.overrideRecipients
    : recipients;
  const subject = options.subject || process.env.EMAIL_SUBJECT || "ABAP LLM Review Report";
  const body =
    options.body ||
    process.env.EMAIL_BODY ||
    "Please find the generated ABAP review reports attached.";
  const from = options.from || process.env.EMAIL_FROM;

  await sendMail(
    { destinationName },
    {
      ...(from ? { from } : {}),
      to: effectiveRecipients,
      subject,
      text: body,
      attachments,
    },
  );

  LOG.info(
    `Sent ${attachments.length} report attachment(s) via MAIL destination '${destinationName}' to ${effectiveRecipients.join(", ")}`,
  );
}

export {
  emailDocxAttachmentsViaDestination,
  emailDocxViaDestination,
};
