 import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../all_feat.dart';
import '../feat_guiding.dart';
part 'teacher_update_notifier.freezed.dart';

@freezed
class TeacherUpdateState with _$TeacherUpdateState {
  const factory TeacherUpdateState.inital() = _Inital;
  const factory TeacherUpdateState.loading() = _Loading;
  const factory TeacherUpdateState.noInternet() = _NoInternet;
  const factory TeacherUpdateState.success(TeacherModel teacher) = _Success;
  const factory TeacherUpdateState.error(ResponseInfoError error) = _Error;
}

class TeacherUpdateNotifier extends StateNotifier<TeacherUpdateState> {
  final TeacherRepository _repository;

  TeacherUpdateNotifier(this._repository) : super(const TeacherUpdateState.inital());

  Future<void> updateTeacher(TeacherModel teacher) async {
    state = const TeacherUpdateState.loading();

    final failOrSuccess = await _repository.updateTeahcer(teacher);
    state = failOrSuccess.fold(
      (l) => TeacherUpdateState.error(l),
      (r) => r.when(
        noInternet: TeacherUpdateState.noInternet,
        data: (entity) => TeacherUpdateState.success(entity),
      ),
    );
  }
} 