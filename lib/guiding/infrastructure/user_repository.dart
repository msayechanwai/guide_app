import 'package:dartz/dartz.dart';
import '../../all_feat.dart';
import '../feat_guiding.dart';

class UserRepository {
  final UserRemoteService _remoteService;

  UserRepository(this._remoteService);

  Future<Either<ResponseInfoError, DomainResult<List<UserModel>>>> getUserList() async {
    try {
      final hodStaffs = await _remoteService.getUserList();

      return right(
        hodStaffs.when(
          noConnection: () => DomainResult.noInternet(),
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
  Future<Either<ResponseInfoError, DomainResult<UserModel>>> addUser(UserModel user) async {
    try {
      final hodStaffs = await _remoteService.addUser(user.toDto());

      return right(
        hodStaffs.when(
          noConnection: () => DomainResult.noInternet(),
          result: (entity) => DomainResult.data(entity.domain),
        ),
      );
    } on ApiException catch (e) {
      return left(ResponseInfoError(e.code, e.message));
    }
  }

  // update
  Future<Either<ResponseInfoError, DomainResult<UserModel>>> updateUser(UserModel user) async {
    try {
      final hodStaffs = await _remoteService.updateUser(user.toDto());

      return right(
        hodStaffs.when(
          noConnection: () => DomainResult.noInternet(),
          result: (entity) => DomainResult.data(entity.domain),
        ),
      );
    } on ApiException catch (e) {
      return left(ResponseInfoError(e.code, e.message));
    }
  }

  //login
  Future<Either<ResponseInfoError, UserModel?>> loginUser(String username, String password) async {
    try {
      final hodStaffs = await _remoteService.getUserList();
      return hodStaffs.when(
        noConnection: () => left(const ResponseInfoError(0, 'No internet connection')),
        result: (entity) {
          final users = entity.map((e) => e.toDomain()).toList();
          UserModel? user;
          for (var u in users) {
            if (u.username == username && u.password == password) {
              user = u;
              break;
            }
          }
          return right(user);
        },
      );
    } on ApiException catch (e) {
      return left(ResponseInfoError(e.code, e.message));
    }
  }
}
