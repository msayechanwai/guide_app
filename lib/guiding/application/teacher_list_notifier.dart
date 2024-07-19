import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guide_app/guiding/domain/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../all_feat.dart';
import '../feat_guiding.dart';

part 'teacher_list_notifier.freezed.dart';

@freezed
class TeacherListState with _$TeacherListState {
  const factory TeacherListState.initial() = _Initial;
  const factory TeacherListState.loading() = _Loading;
  const factory TeacherListState.empty() = _Empty;
  const factory TeacherListState.noInternet() = _NoInternet;
  const factory TeacherListState.success(List<TeacherModel> message) = _Success;
  const factory TeacherListState.error(ResponseInfoError error) = _Error;
}

class TeacherListNotifier extends StateNotifier<TeacherListState> {
  final TeacherRepository _repository;
  TeacherListNotifier(this._repository)
      : super(const TeacherListState.initial());

    Future<void> getTeacherList() async {
    state = const TeacherListState.loading();
    final failureOrSuccess = await _repository.getTeacherList();
    state = failureOrSuccess.fold(
      (l) => TeacherListState.error(l),
      (r) => r.when(
        noInternet: TeacherListState.noInternet,
        data: (tList) => tList.isEmpty
            ? const TeacherListState.empty()
            : TeacherListState.success(tList),
      ),
    );
  } 
} 