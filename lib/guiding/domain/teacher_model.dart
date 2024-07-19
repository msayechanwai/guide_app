import 'package:freezed_annotation/freezed_annotation.dart';
import '../feat_guiding.dart';

part 'teacher_model.freezed.dart';

@freezed
class TeacherModel with _$TeacherModel {
  const TeacherModel._();//toDto
  const factory TeacherModel({
    required String teacherName,
    required String education,
    required String major,
    required String phno,
    required String password,
    required String address,
    required DateTime createdAt,
    required String teacherId,
  }) = _TeacherModel;
     TeacherDto toDto() => TeacherDto(
        teacherName : teacherName,
        education : education,
        major: major,
        phno : phno,
        password : password,
        address : address,
        createdAt : createdAt,
        teacherId : teacherId,
    );    
}
