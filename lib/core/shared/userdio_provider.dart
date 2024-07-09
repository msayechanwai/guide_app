import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

Provider<Dio> dioProvider = Provider((ref) {
 Dio dio = Dio(
      BaseOptions(baseUrl: 'https://668b72c80b61b8d23b099b29.mockapi.io/api/'));
      
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );
  return dio;
});
