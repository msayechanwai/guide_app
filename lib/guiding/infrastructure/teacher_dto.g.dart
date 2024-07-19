// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherDtoImpl _$$TeacherDtoImplFromJson(Map<String, dynamic> json) =>
    _$TeacherDtoImpl(
      teacherName: stringFromJson(json['teacherName']),
      education: stringFromJson(json['education']),
      major: stringFromJson(json['major']),
      phno: stringFromJson(json['phno']),
      password: stringFromJson(json['password']),
      address: stringFromJson(json['address']),
      createdAt: dateTimeFromJson(json['createdAt']),
      teacherId: stringFromJson(json['teacherId']),
    );

Map<String, dynamic> _$$TeacherDtoImplToJson(_$TeacherDtoImpl instance) =>
    <String, dynamic>{
      'teacherName': instance.teacherName,
      'education': instance.education,
      'major': instance.major,
      'phno': instance.phno,
      'password': instance.password,
      'address': instance.address,
      'createdAt': instance.createdAt.toIso8601String(),
      'teacherId': instance.teacherId,
    };
