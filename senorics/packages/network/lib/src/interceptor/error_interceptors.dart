import 'package:dio/dio.dart';

///
class ErrorInterceptors extends Interceptor {
  ///
  ErrorInterceptors(this.dio);

  ///
  final Dio dio;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw TimeOutException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}

///
class OnDioError extends DioError {
  ///
  OnDioError(this.err) : super(requestOptions: err.requestOptions);

  ///
  final DioError err;

  String _onApiError() {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return TimeOutException(err.requestOptions).message;
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            return BadRequestException(err.requestOptions).message;

          case 401:
            return UnauthorizedException(err.requestOptions).message;

          case 404:
            return NotFoundException(err.requestOptions).message;

          case 409:
            return ConflictException(err.requestOptions).message;
          case 500:
            return InternalServerErrorException(err.requestOptions).message;
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        return NoInternetConnectionException(err.requestOptions).message;
    }
    return 'Something went wrong';
  }

  @override
  String toString() => _onApiError();
}

///
class BadRequestException extends DioError {
  ///
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => 'Invalid request';
}

///
class InternalServerErrorException extends DioError {
  ///
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

///
class ConflictException extends DioError {
  ///
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

///
class UnauthorizedException extends DioError {
  ///
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

///
class NotFoundException extends DioError {
  ///
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found for';
  }
}

///
class NoInternetConnectionException extends DioError {
  ///
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

///
class TimeOutException extends DioError {
  ///
  TimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
