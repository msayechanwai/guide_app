import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/shared/teacherdio_provider.dart';
import '../feat_guiding.dart';

final teacherRemoteServiceProvider = Provider((ref) {
  return TeacherRemoteService(ref.watch(dioProvider));
});

final teacherRepositoryProvider = Provider((ref) {
  return TeacherRepository(ref.watch(teacherRemoteServiceProvider));
});

final teacherListNotifierProvider =
    StateNotifierProvider<TeacherListNotifier, TeacherListState>((ref) {
  return TeacherListNotifier(ref.watch(teacherRepositoryProvider));
});
//delete
final teacherDeleteNotifierProvider =
    StateNotifierProvider<TeacherDeleteNotifier, TeacherDeleteState>((ref) {
  return TeacherDeleteNotifier(ref.watch(teacherRepositoryProvider));
});
//add
final teacherAddNotifierProvider =
    StateNotifierProvider<TeacherAddNotifier, TeacherAddState>((ref) {
  return TeacherAddNotifier(ref.watch(teacherRepositoryProvider));
});
//update
final teacherUpdateNotifierProvider =
    StateNotifierProvider<TeacherUpdateNotifier, TeacherUpdateState>((ref) {
  return TeacherUpdateNotifier(ref.watch(teacherRepositoryProvider));
});

final currentTeacherProvider = StateProvider<TeacherModel?>((ref) => null);//add new