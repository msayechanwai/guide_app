 import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feat_guiding.dart';
import '../../all_feat.dart';
part 'teacher_add_notifier.freezed.dart';

@freezed
class TeacherAddState with _$TeacherAddState {
  const factory TeacherAddState.inital() = _Inital;
  const factory TeacherAddState.loading() = _Loading;
  const factory TeacherAddState.noInternet() = _NoInternet;
  const factory TeacherAddState.success(TeacherModel teacher) = _Success;
  const factory TeacherAddState.error(ResponseInfoError error) = _Error;
}

class TeacherAddNotifier extends StateNotifier<TeacherAddState> {
  final TeacherRepository _repository;

  TeacherAddNotifier(this._repository) : super(const TeacherAddState.inital());

  Future<void> addTeacher(TeacherModel teacher) async {
    state = const TeacherAddState.loading();

    final failOrSuccess = await _repository.addTeacher(teacher);
    state = failOrSuccess.fold(
      (l) => TeacherAddState.error(l),
      (r) => r.when(
        noInternet: TeacherAddState.noInternet,
        data: (entity) => TeacherAddState.success(entity),
      ),
    );
  }
} 