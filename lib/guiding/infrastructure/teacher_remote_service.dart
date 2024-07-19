import 'package:dio/dio.dart';
import 'package:guide_app/core/feat_core.dart';
import '../../all_feat.dart';
import 'teacher_dto.dart';

class TeacherRemoteService {
  final Dio _dio;

  TeacherRemoteService(this._dio);

  Future<NetworkResult<List<TeacherDto>>> getTeacherList() async {
    try {
      final response = await _dio.get('teacher');
      print(response);
      if (response.statusCode == 200) {
        var resData = response.data as List<dynamic>;
        var teacherList = resData.map((e) => TeacherDto.fromJson(e)).toList();

        return NetworkResult.result(teacherList);
      } else {
        throw ApiException(
          code: response.statusCode,
          message: response.statusMessage,
        );
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        return const NetworkResult.noConnection();
      } else if (e.error != null) {
        throw ApiException(
          code: e.response?.statusCode,
          message: e.response?.statusMessage,
        );
      } else {
        rethrow;
      }
    }
  }

  // delete
  Future<NetworkResult<void>> deleteTeacher(String id) async {
    try {
      final response = await _dio.delete('user/$id');
      if (response.statusCode == 200) {
        return const NetworkResult.result(null);
      } else {
        throw ApiException(
          code: response.statusCode,
          message: response.statusMessage,
        );
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        return const NetworkResult.noConnection();
      } else if (e.error != null) {
        throw ApiException(
          code: e.response?.statusCode,
          message: e.response?.statusMessage,
        );
      } else {
        rethrow;
      }
    }
  }

  // add
  Future<NetworkResult<TeacherDto>> addTeacher(TeacherDto teacher) async {
    print("add teacher in remote => $teacher");
    try {
      final response = await _dio.post('teacher', data: teacher.toJson());
      print("response code => ${response.statusCode}");
      print("response message => ${response.statusMessage}");
      if (response.statusCode == 201) {
        var resData = response.data as dynamic;
        var teacher = TeacherDto.fromJson(resData);

        return NetworkResult.result(teacher);
      } else {
        throw ApiException(
          code: response.statusCode,
          message: response.statusMessage,
        );
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        return const NetworkResult.noConnection();
      } else if (e.error != null) {
        throw ApiException(
          code: e.response?.statusCode,
          message: e.response?.statusMessage,
        );
      } else {
        rethrow;
      }
    }
  }

  // update
  Future<NetworkResult<TeacherDto>> updateTeacher(TeacherDto teacher) async {
    print("update teacher in remote => $teacher");
    try {
      final response = await _dio.put('teacher/${teacher.teacherId}', data: teacher.toJson());
      print("response code => ${response.statusCode}");
      print("response message => ${response.statusMessage}");
      if (response.statusCode == 200) {
        var resData = response.data as dynamic;
        var teacher = TeacherDto.fromJson(resData);

        return NetworkResult.result(teacher);
      } else {
        throw ApiException(
          code: response.statusCode,
          message: response.statusMessage,
        );
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        return const NetworkResult.noConnection();
      } else if (e.error != null) {
        throw ApiException(
          code: e.response?.statusCode,
          message: e.response?.statusMessage,
        );
      } else {
        rethrow;
      }
    }
  }
}
