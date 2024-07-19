// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherDto _$TeacherDtoFromJson(Map<String, dynamic> json) {
  return _TeacherDto.fromJson(json);
}

/// @nodoc
mixin _$TeacherDto {
  @JsonKey(name: "teacherName", fromJson: stringFromJson)
  String get teacherName => throw _privateConstructorUsedError;
  @JsonKey(name: "education", fromJson: stringFromJson)
  String get education => throw _privateConstructorUsedError;
  @JsonKey(name: "major", fromJson: stringFromJson)
  String get major => throw _privateConstructorUsedError;
  @JsonKey(name: "phno", fromJson: stringFromJson)
  String get phno => throw _privateConstructorUsedError;
  @JsonKey(name: "password", fromJson: stringFromJson)
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: "address", fromJson: stringFromJson)
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt", fromJson: dateTimeFromJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "teacherId", fromJson: stringFromJson)
  String get teacherId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherDtoCopyWith<TeacherDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherDtoCopyWith<$Res> {
  factory $TeacherDtoCopyWith(
          TeacherDto value, $Res Function(TeacherDto) then) =
      _$TeacherDtoCopyWithImpl<$Res, TeacherDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "teacherName", fromJson: stringFromJson)
      String teacherName,
      @JsonKey(name: "education", fromJson: stringFromJson) String education,
      @JsonKey(name: "major", fromJson: stringFromJson) String major,
      @JsonKey(name: "phno", fromJson: stringFromJson) String phno,
      @JsonKey(name: "password", fromJson: stringFromJson) String password,
      @JsonKey(name: "address", fromJson: stringFromJson) String address,
      @JsonKey(name: "createdAt", fromJson: dateTimeFromJson)
      DateTime createdAt,
      @JsonKey(name: "teacherId", fromJson: stringFromJson) String teacherId});
}

/// @nodoc
class _$TeacherDtoCopyWithImpl<$Res, $Val extends TeacherDto>
    implements $TeacherDtoCopyWith<$Res> {
  _$TeacherDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherName = null,
    Object? education = null,
    Object? major = null,
    Object? phno = null,
    Object? password = null,
    Object? address = null,
    Object? createdAt = null,
    Object? teacherId = null,
  }) {
    return _then(_value.copyWith(
      teacherName: null == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String,
      phno: null == phno
          ? _value.phno
          : phno // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherDtoImplCopyWith<$Res>
    implements $TeacherDtoCopyWith<$Res> {
  factory _$$TeacherDtoImplCopyWith(
          _$TeacherDtoImpl value, $Res Function(_$TeacherDtoImpl) then) =
      __$$TeacherDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "teacherName", fromJson: stringFromJson)
      String teacherName,
      @JsonKey(name: "education", fromJson: stringFromJson) String education,
      @JsonKey(name: "major", fromJson: stringFromJson) String major,
      @JsonKey(name: "phno", fromJson: stringFromJson) String phno,
      @JsonKey(name: "password", fromJson: stringFromJson) String password,
      @JsonKey(name: "address", fromJson: stringFromJson) String address,
      @JsonKey(name: "createdAt", fromJson: dateTimeFromJson)
      DateTime createdAt,
      @JsonKey(name: "teacherId", fromJson: stringFromJson) String teacherId});
}

/// @nodoc
class __$$TeacherDtoImplCopyWithImpl<$Res>
    extends _$TeacherDtoCopyWithImpl<$Res, _$TeacherDtoImpl>
    implements _$$TeacherDtoImplCopyWith<$Res> {
  __$$TeacherDtoImplCopyWithImpl(
      _$TeacherDtoImpl _value, $Res Function(_$TeacherDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherName = null,
    Object? education = null,
    Object? major = null,
    Object? phno = null,
    Object? password = null,
    Object? address = null,
    Object? createdAt = null,
    Object? teacherId = null,
  }) {
    return _then(_$TeacherDtoImpl(
      teacherName: null == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String,
      phno: null == phno
          ? _value.phno
          : phno // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherDtoImpl extends _TeacherDto {
  const _$TeacherDtoImpl(
      {@JsonKey(name: "teacherName", fromJson: stringFromJson)
      required this.teacherName,
      @JsonKey(name: "education", fromJson: stringFromJson)
      required this.education,
      @JsonKey(name: "major", fromJson: stringFromJson) required this.major,
      @JsonKey(name: "phno", fromJson: stringFromJson) required this.phno,
      @JsonKey(name: "password", fromJson: stringFromJson)
      required this.password,
      @JsonKey(name: "address", fromJson: stringFromJson) required this.address,
      @JsonKey(name: "createdAt", fromJson: dateTimeFromJson)
      required this.createdAt,
      @JsonKey(name: "teacherId", fromJson: stringFromJson)
      required this.teacherId})
      : super._();

  factory _$TeacherDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherDtoImplFromJson(json);

  @override
  @JsonKey(name: "teacherName", fromJson: stringFromJson)
  final String teacherName;
  @override
  @JsonKey(name: "education", fromJson: stringFromJson)
  final String education;
  @override
  @JsonKey(name: "major", fromJson: stringFromJson)
  final String major;
  @override
  @JsonKey(name: "phno", fromJson: stringFromJson)
  final String phno;
  @override
  @JsonKey(name: "password", fromJson: stringFromJson)
  final String password;
  @override
  @JsonKey(name: "address", fromJson: stringFromJson)
  final String address;
  @override
  @JsonKey(name: "createdAt", fromJson: dateTimeFromJson)
  final DateTime createdAt;
  @override
  @JsonKey(name: "teacherId", fromJson: stringFromJson)
  final String teacherId;

  @override
  String toString() {
    return 'TeacherDto(teacherName: $teacherName, education: $education, major: $major, phno: $phno, password: $password, address: $address, createdAt: $createdAt, teacherId: $teacherId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherDtoImpl &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.phno, phno) || other.phno == phno) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, teacherName, education, major,
      phno, password, address, createdAt, teacherId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherDtoImplCopyWith<_$TeacherDtoImpl> get copyWith =>
      __$$TeacherDtoImplCopyWithImpl<_$TeacherDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherDtoImplToJson(
      this,
    );
  }
}

abstract class _TeacherDto extends TeacherDto {
  const factory _TeacherDto(
      {@JsonKey(name: "teacherName", fromJson: stringFromJson)
      required final String teacherName,
      @JsonKey(name: "education", fromJson: stringFromJson)
      required final String education,
      @JsonKey(name: "major", fromJson: stringFromJson)
      required final String major,
      @JsonKey(name: "phno", fromJson: stringFromJson)
      required final String phno,
      @JsonKey(name: "password", fromJson: stringFromJson)
      required final String password,
      @JsonKey(name: "address", fromJson: stringFromJson)
      required final String address,
      @JsonKey(name: "createdAt", fromJson: dateTimeFromJson)
      required final DateTime createdAt,
      @JsonKey(name: "teacherId", fromJson: stringFromJson)
      required final String teacherId}) = _$TeacherDtoImpl;
  const _TeacherDto._() : super._();

  factory _TeacherDto.fromJson(Map<String, dynamic> json) =
      _$TeacherDtoImpl.fromJson;

  @override
  @JsonKey(name: "teacherName", fromJson: stringFromJson)
  String get teacherName;
  @override
  @JsonKey(name: "education", fromJson: stringFromJson)
  String get education;
  @override
  @JsonKey(name: "major", fromJson: stringFromJson)
  String get major;
  @override
  @JsonKey(name: "phno", fromJson: stringFromJson)
  String get phno;
  @override
  @JsonKey(name: "password", fromJson: stringFromJson)
  String get password;
  @override
  @JsonKey(name: "address", fromJson: stringFromJson)
  String get address;
  @override
  @JsonKey(name: "createdAt", fromJson: dateTimeFromJson)
  DateTime get createdAt;
  @override
  @JsonKey(name: "teacherId", fromJson: stringFromJson)
  String get teacherId;
  @override
  @JsonKey(ignore: true)
  _$$TeacherDtoImplCopyWith<_$TeacherDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
