import 'package:dio/dio.dart';
import 'package:guide_app/core/feat_core.dart';
import '../../all_feat.dart';
import 'user_dto.dart';

class UserRemoteService {
  final Dio _dio;

  UserRemoteService(this._dio);

  Future<NetworkResult<List<UserDto>>> getUserList() async {
    try {
      final response = await _dio.get('user');
      print(response);
      if (response.statusCode == 200) {
        var resData = response.data as List<dynamic>;
        var userList = resData.map((e) => UserDto.fromJson(e)).toList();

        return NetworkResult.result(userList);
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
  Future<NetworkResult<void>> deleteUser(String id) async {
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

  //Add
   Future<NetworkResult<UserDto>> addUser(UserDto user) async {
    print("add user in remote => $user");
    try {
      final response = await _dio.post('user', data: user.toJson());
      print("response code => ${response.statusCode}");
      print("response message => ${response.statusMessage}");
      if (response.statusCode == 201) {
        var resData = response.data as dynamic;
        var user = UserDto.fromJson(resData);

        return NetworkResult.result(user);
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

  //Update
  Future<NetworkResult<UserDto>> updateUser(UserDto user) async {
    print("update user in remote => $user");
    try {
      final response = await _dio.put('user/${user.id}', data: user.toJson());
      print("response code => ${response.statusCode}");
      print("response message => ${response.statusMessage}");
      if (response.statusCode == 200) {
        var resData = response.data as dynamic;
        var user = UserDto.fromJson(resData);

        return NetworkResult.result(user);
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