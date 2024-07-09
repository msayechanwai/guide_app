import 'package:guide_app/core/config/app_strings.dart';

class ApiException implements Exception {
  final int? code;
  final String? message;

  ApiException({
    this.code = 999,
    this.message = AppStrings.unknownError,
  });
}
