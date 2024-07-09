// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      username: stringFromJson(json['username']),
      address: stringFromJson(json['address']),
      phno: stringFromJson(json['phno']),
      createdat: dateTimeFromJson(json['createdat']),
      id: stringFromJson(json['id']),
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'address': instance.address,
      'phno': instance.phno,
      'createdat': instance.createdat.toIso8601String(),
      'id': instance.id,
    };
