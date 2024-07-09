import 'package:dartz/dartz.dart';
import '../../all_feat.dart';
import '../domain/user_model.dart';
import 'user_remote_service.dart';

class UserRepository {
  final UserRemoteService _remoteService;

  UserRepository(this._remoteService);
  Future<Either<ResponseInfoError, DomainResult<List<UserModel>>>>
      getUserList() async {
    try {
      final hodStaffs = await _remoteService.getUserList();

      return right(
        hodStaffs.when(
          noConnection: DomainResult.noInternet,
          result: (entity) => DomainResult.data(
            entity.map((e) => e.toDomain()).toList(),
          ),
        ),
      );
    } on ApiException catch (e) {
      return left(ResponseInfoError(e.code, e.message));
    }
  }

  // delete
  Future<Either<ResponseInfoError, DomainResult<String>>> deleteUser(String id) async {
  try {
    final deleteResult = await _remoteService.deleteUser(id);

    return right(
      deleteResult.when(
        noConnection: () => const DomainResult.noInternet(),
        result: (_) => DomainResult.data('success'),
      ),
    );
  } on ApiException catch (e) {
    return left(ResponseInfoError(e.code, e.message));
  }
} 

// add
   Future<Either<ResponseInfoError, DomainResult<UserModel>>> addUser(
      UserModel user) async {
    print("add user in repo => $id");
    try {
      final hodStaffs = await _remoteService.addUser(user.toDto());
      // The argument type 'UserModel' can't be assigned to the parameter type 'UserDto'.

      return right(
        hodStaffs.when(
          noConnection: DomainResult.noInternet,
          result: (entity) => DomainResult.data(entity.domain),
        ),
      );
    } on ApiException catch (e) {
      return left(ResponseInfoError(e.code, e.message));
    }
  }
  //update
  Future<Either<ResponseInfoError, DomainResult<UserModel>>> updateUser(
      UserModel user) async {
    print("update user in repo => $id");
    try {
      final hodStaffs = await _remoteService.updateUser(user.toDto());
      // The argument type 'UserModel' can't be assigned to the parameter type 'UserDto'.

      return right(
        hodStaffs.when(
          noConnection: DomainResult.noInternet,
          result: (entity) => DomainResult.data(entity.domain),
        ),
      );
    } on ApiException catch (e) {
      return left(ResponseInfoError(e.code, e.message));
    }
  }
  
}
 