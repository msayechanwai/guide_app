import 'package:dartz/dartz.dart';
import '../../all_feat.dart';
import '../feat_guiding.dart';

class TeacherRepository {
  final TeacherRemoteService _remoteService;

  TeacherRepository(this._remoteService);

  Future<Either<ResponseInfoError, DomainResult<List<TeacherModel>>>> getTeacherList() async {
    try {
      final hodStaffs = await _remoteService.getTeacherList();
      print("hodstaffs=> hodStaffs");

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
  Future<Either<ResponseInfoError, DomainResult<String>>> deleteTeacher(String id) async {
    try {
      final deleteResult = await _remoteService.deleteTeacher(id);

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
  Future<Either<ResponseInfoError, DomainResult<TeacherModel>>> addTeacher(TeacherModel teacher) async {
    try {
      final hodStaffs = await _remoteService.addTeacher(teacher.toDto());

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
  Future<Either<ResponseInfoError, DomainResult<TeacherModel>>> updateTeahcer(TeacherModel teacher) async {
    try {
      final hodStaffs = await _remoteService.updateTeacher(teacher.toDto());

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
  Future<Either<ResponseInfoError, TeacherModel?>> loginTeacher(String teacherName, String password) async {
    try {
      final hodStaffs = await _remoteService.getTeacherList();
      return hodStaffs.when(
        noConnection: () => left(const ResponseInfoError(0, 'No internet connection')),
        result: (entity) {
          final teachers = entity.map((e) => e.toDomain()).toList();
          TeacherModel? teacher;
          for (var u in teachers) {
            if (u.teacherName == teacherName && u.password == password) {
              teacher = u;
              break;
            }
          }
          return right(teacher);
        },
      );
    } on ApiException catch (e) {
      return left(ResponseInfoError(e.code, e.message));
    }
  }

  //fliter by major
  Future<Either<ResponseInfoError, DomainResult<List<TeacherModel>>>> getTeachersByMajor(String major) async {
    try {
      final result = await _remoteService.getTeacherList();

      return right(
        result.when(
          noConnection: () => DomainResult.noInternet(),
          result: (entity) => DomainResult.data(
            entity.where((e) => e.major == major).map((e) => e.toDomain()).toList(),
          ),
        ),
      );
    } on ApiException catch (e) {
      return left(ResponseInfoError(e.code, e.message));
    }
  }
}
