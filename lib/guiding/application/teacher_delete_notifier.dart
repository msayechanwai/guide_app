import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../all_feat.dart';
import '../feat_guiding.dart';

part 'teacher_delete_notifier.freezed.dart';

@freezed
class TeacherDeleteState with _$TeacherDeleteState {
  const factory TeacherDeleteState.initial() = _Initial;
  const factory TeacherDeleteState.loading() = _Loading;
  const factory TeacherDeleteState.noInternet() = _NoInternet;
  const factory TeacherDeleteState.success(String msg) = _Success;
  const factory TeacherDeleteState.error(ResponseInfoError error) = _Error;
}

class TeacherDeleteNotifier extends StateNotifier<TeacherDeleteState> {
  final TeacherRepository _repository;

  TeacherDeleteNotifier(this._repository) : super(const TeacherDeleteState.initial());

   Future<void> deleteTeacher(String id) async {
    state = const TeacherDeleteState.loading();
    final failureOrSuccess = await _repository.deleteTeacher(id);
    state = failureOrSuccess.fold(
      (l) => TeacherDeleteState.error(l),
      (r) => r.when(
        noInternet: TeacherDeleteState.noInternet,
        data: (str) => const TeacherDeleteState.success("Delete Success !"),
      ),
    ); 
  }
}