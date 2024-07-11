import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

Provider<Dio> dioProvider = Provider((ref) {
 Dio dio = Dio(
      BaseOptions(baseUrl: 'https://668cfd8e099db4c579f14388.mockapi.io/api/'));
      
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
