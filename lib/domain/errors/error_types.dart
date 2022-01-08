enum AppErrorType {
  unknownError,
}

enum ServerErrorType {
  somethingWentWrong,
  serverIsNotAvailable,
  connectionTimeout,
  connectionError,
  apiResponseParsingError,
  badRequest,
  accessTokenError,
  forbidden,
  resourceNotFound,
  methodNotAllowed,
  internalServerError,
  badGateway,

  // TODO Custom errors
}
