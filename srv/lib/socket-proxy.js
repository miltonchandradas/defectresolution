function encodeBase64(value) {
  return Buffer.from(value, 'utf8').toString('base64');
}

async function customAuthRequestHandler(jwt, cloudConnectorLocationId) {
  const jwtBytes = [...Buffer.from(jwt)];
  const jwtLengthBuffer = Buffer.alloc(4);
  jwtLengthBuffer.writeUInt32BE(jwtBytes.length, 0);

  const ccLocationIdBase64String = cloudConnectorLocationId
    ? encodeBase64(cloudConnectorLocationId)
    : '';
  const cloudConnectorLocationIdLengthBuffer = Buffer.alloc(1);
  cloudConnectorLocationIdLengthBuffer.writeUInt8(
    Buffer.byteLength(ccLocationIdBase64String)
  );

  return Buffer.from([
    0x01,
    ...jwtLengthBuffer,
    ...jwtBytes,
    ...cloudConnectorLocationIdLengthBuffer,
    ...Buffer.from(ccLocationIdBase64String)
  ]);
}

async function customAuthResponseHandler(data) {
  return data[0] === 0x01 && data[1] === 0x00;
}

export {
  customAuthRequestHandler,
  customAuthResponseHandler
};
