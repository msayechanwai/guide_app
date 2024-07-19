import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/shared/utils.dart';
import '../domain/user_model.dart';
import '../feat_guiding.dart';

part 'teacher_dto.freezed.dart';
part 'teacher_dto.g.dart';

@freezed
class TeacherDto with _$TeacherDto {
  const TeacherDto._();
  const factory TeacherDto({
    @JsonKey(name: "teacherName", fromJson: stringFromJson)
    required String teacherName,
    @JsonKey(name: "education", fromJson: stringFromJson) required String education,
    @JsonKey(name: "major", fromJson: stringFromJson) required String major,
    @JsonKey(name: "phno", fromJson: stringFromJson) required String phno,
    @JsonKey(name: "password", fromJson: stringFromJson) required String password,
    @JsonKey(name: "address", fromJson: stringFromJson) required String address,
    @JsonKey(name: "createdAt", fromJson: dateTimeFromJson) required DateTime createdAt,
    @JsonKey(name: "teacherId", fromJson: stringFromJson) required String teacherId,
  }) =_TeacherDto;

  factory TeacherDto.fromJson(Map<String, dynamic> json) =>
      _$TeacherDtoFromJson(json);

  // get method
  TeacherModel get domain => TeacherModel(
        teacherName : teacherName,
        education : education,
        major: major,
        phno: phno,
        password: password,
        address: address,
        createdAt : createdAt,
        teacherId : teacherId,
      );

  // normal method
  TeacherModel toDomain() => TeacherModel(
        teacherName : teacherName,
        education : education,
        major: major,
        phno: phno,
        password: password,
        address: address,
        createdAt : createdAt,
        teacherId : teacherId,
      );  
}