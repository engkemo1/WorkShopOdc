import '../../database/remote/dio_exceptions.dart';

CatchError(e) {
  DioExceptions error = DioExceptions.fromDioError(e);
  if (error.message != "Something went wrong") return error.message;
  int? code = e.response!.statusCode!;
  error = DioExceptions.handleError(statusCode: code, error: e.response!.data);
  return error.MessageError;
}
