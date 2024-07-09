import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_info_error.freezed.dart';

@freezed
class ResponseInfoError with _$ResponseInfoError {
  const factory ResponseInfoError(
    int? code,
    String? message,
  ) = _ResponseInfoError;
}