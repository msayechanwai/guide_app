import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

Provider<Dio> dioProvider = Provider((ref) {
 Dio dio = Dio(
      BaseOptions(baseUrl: 'https://6694ae494bd61d8314c83434.mockapi.io/api/'));
      
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
