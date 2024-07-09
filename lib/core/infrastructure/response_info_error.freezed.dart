// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_info_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResponseInfoError {
  int? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResponseInfoErrorCopyWith<ResponseInfoError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseInfoErrorCopyWith<$Res> {
  factory $ResponseInfoErrorCopyWith(
          ResponseInfoError value, $Res Function(ResponseInfoError) then) =
      _$ResponseInfoErrorCopyWithImpl<$Res, ResponseInfoError>;
  @useResult
  $Res call({int? code, String? message});
}

/// @nodoc
class _$ResponseInfoErrorCopyWithImpl<$Res, $Val extends ResponseInfoError>
    implements $ResponseInfoErrorCopyWith<$Res> {
  _$ResponseInfoErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseInfoErrorImplCopyWith<$Res>
    implements $ResponseInfoErrorCopyWith<$Res> {
  factory _$$ResponseInfoErrorImplCopyWith(_$ResponseInfoErrorImpl value,
          $Res Function(_$ResponseInfoErrorImpl) then) =
      __$$ResponseInfoErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, String? message});
}

/// @nodoc
class __$$ResponseInfoErrorImplCopyWithImpl<$Res>
    extends _$ResponseInfoErrorCopyWithImpl<$Res, _$ResponseInfoErrorImpl>
    implements _$$ResponseInfoErrorImplCopyWith<$Res> {
  __$$ResponseInfoErrorImplCopyWithImpl(_$ResponseInfoErrorImpl _value,
      $Res Function(_$ResponseInfoErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ResponseInfoErrorImpl(
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ResponseInfoErrorImpl implements _ResponseInfoError {
  const _$ResponseInfoErrorImpl(this.code, this.message);

  @override
  final int? code;
  @override
  final String? message;

  @override
  String toString() {
    return 'ResponseInfoError(code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseInfoErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseInfoErrorImplCopyWith<_$ResponseInfoErrorImpl> get copyWith =>
      __$$ResponseInfoErrorImplCopyWithImpl<_$ResponseInfoErrorImpl>(
          this, _$identity);
}

abstract class _ResponseInfoError implements ResponseInfoError {
  const factory _ResponseInfoError(final int? code, final String? message) =
      _$ResponseInfoErrorImpl;

  @override
  int? get code;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ResponseInfoErrorImplCopyWith<_$ResponseInfoErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
