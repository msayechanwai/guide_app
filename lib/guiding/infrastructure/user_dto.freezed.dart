// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  @JsonKey(name: "username", fromJson: stringFromJson)
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "address", fromJson: stringFromJson)
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "phno", fromJson: stringFromJson)
  String get phno => throw _privateConstructorUsedError;
  @JsonKey(name: "password", fromJson: stringFromJson)
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: "createdat", fromJson: dateTimeFromJson)
  DateTime get createdat => throw _privateConstructorUsedError;
  @JsonKey(name: "id", fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "username", fromJson: stringFromJson) String username,
      @JsonKey(name: "address", fromJson: stringFromJson) String address,
      @JsonKey(name: "phno", fromJson: stringFromJson) String phno,
      @JsonKey(name: "password", fromJson: stringFromJson) String password,
      @JsonKey(name: "createdat", fromJson: dateTimeFromJson)
      DateTime createdat,
      @JsonKey(name: "id", fromJson: stringFromJson) String id});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? address = null,
    Object? phno = null,
    Object? password = null,
    Object? createdat = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phno: null == phno
          ? _value.phno
          : phno // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdat: null == createdat
          ? _value.createdat
          : createdat // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
          _$UserDtoImpl value, $Res Function(_$UserDtoImpl) then) =
      __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "username", fromJson: stringFromJson) String username,
      @JsonKey(name: "address", fromJson: stringFromJson) String address,
      @JsonKey(name: "phno", fromJson: stringFromJson) String phno,
      @JsonKey(name: "password", fromJson: stringFromJson) String password,
      @JsonKey(name: "createdat", fromJson: dateTimeFromJson)
      DateTime createdat,
      @JsonKey(name: "id", fromJson: stringFromJson) String id});
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
      _$UserDtoImpl _value, $Res Function(_$UserDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? address = null,
    Object? phno = null,
    Object? password = null,
    Object? createdat = null,
    Object? id = null,
  }) {
    return _then(_$UserDtoImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phno: null == phno
          ? _value.phno
          : phno // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdat: null == createdat
          ? _value.createdat
          : createdat // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl extends _UserDto {
  const _$UserDtoImpl(
      {@JsonKey(name: "username", fromJson: stringFromJson)
      required this.username,
      @JsonKey(name: "address", fromJson: stringFromJson) required this.address,
      @JsonKey(name: "phno", fromJson: stringFromJson) required this.phno,
      @JsonKey(name: "password", fromJson: stringFromJson)
      required this.password,
      @JsonKey(name: "createdat", fromJson: dateTimeFromJson)
      required this.createdat,
      @JsonKey(name: "id", fromJson: stringFromJson) required this.id})
      : super._();

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

  @override
  @JsonKey(name: "username", fromJson: stringFromJson)
  final String username;
  @override
  @JsonKey(name: "address", fromJson: stringFromJson)
  final String address;
  @override
  @JsonKey(name: "phno", fromJson: stringFromJson)
  final String phno;
  @override
  @JsonKey(name: "password", fromJson: stringFromJson)
  final String password;
  @override
  @JsonKey(name: "createdat", fromJson: dateTimeFromJson)
  final DateTime createdat;
  @override
  @JsonKey(name: "id", fromJson: stringFromJson)
  final String id;

  @override
  String toString() {
    return 'UserDto(username: $username, address: $address, phno: $phno, password: $password, createdat: $createdat, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phno, phno) || other.phno == phno) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.createdat, createdat) ||
                other.createdat == createdat) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, username, address, phno, password, createdat, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDto extends UserDto {
  const factory _UserDto(
      {@JsonKey(name: "username", fromJson: stringFromJson)
      required final String username,
      @JsonKey(name: "address", fromJson: stringFromJson)
      required final String address,
      @JsonKey(name: "phno", fromJson: stringFromJson)
      required final String phno,
      @JsonKey(name: "password", fromJson: stringFromJson)
      required final String password,
      @JsonKey(name: "createdat", fromJson: dateTimeFromJson)
      required final DateTime createdat,
      @JsonKey(name: "id", fromJson: stringFromJson)
      required final String id}) = _$UserDtoImpl;
  const _UserDto._() : super._();

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

  @override
  @JsonKey(name: "username", fromJson: stringFromJson)
  String get username;
  @override
  @JsonKey(name: "address", fromJson: stringFromJson)
  String get address;
  @override
  @JsonKey(name: "phno", fromJson: stringFromJson)
  String get phno;
  @override
  @JsonKey(name: "password", fromJson: stringFromJson)
  String get password;
  @override
  @JsonKey(name: "createdat", fromJson: dateTimeFromJson)
  DateTime get createdat;
  @override
  @JsonKey(name: "id", fromJson: stringFromJson)
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
