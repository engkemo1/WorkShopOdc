import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'DioHelper.dart';

class DioExceptions implements Exception {
  String? message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;

      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }
  String? MessageError;

  DioExceptions.handleError(
      {required int? statusCode, required dynamic error}) {
    switch (statusCode) {
      case 400:
        MessageError = error['message'];
        break;
      case 401:
        MessageError = 'Unauthorized';
        break;
      case 403:
        MessageError = 'Forbidden';
        break;
      case 404:
        MessageError = error['message'];
        break;
      case 500:
        MessageError = 'Internal server error';
        break;
      case 502:
        MessageError = 'Bad gateway';
        break;
      default:
        MessageError = 'Oops something went wrong';
    }
  }

  @override
  String toString() => message ?? '';
}
