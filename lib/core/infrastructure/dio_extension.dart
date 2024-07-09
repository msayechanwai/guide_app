import 'dart:io';

import 'package:dio/dio.dart';

extension DioExceptionX on DioException {
  bool get isNoConnectionError {
    if (type == DioExceptionType.unknown && error is SocketException) {
      return true;
    } else if (type == DioExceptionType.connectionError) {
      return true;
    } else if (type == DioExceptionType.connectionTimeout) {
      return true;
    } else {
      return false;
    }
  }
}


