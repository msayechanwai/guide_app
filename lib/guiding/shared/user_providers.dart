import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/shared/userdio_provider.dart';
import '../feat_guiding.dart';

final userRemoteServiceProvider = Provider((ref) {
  return UserRemoteService(ref.watch(dioProvider));
});

final userRepositoryProvider = Provider((ref) {
  return UserRepository(ref.watch(userRemoteServiceProvider));
});

final userListNotifierProvider =
    StateNotifierProvider<UserListNotifier, UserListState>((ref) {
  return UserListNotifier(ref.watch(userRepositoryProvider));
});
//delete
final userDeleteNotifierProvider =
    StateNotifierProvider<UserDeleteNotifier, UserDeleteState>((ref) {
  return UserDeleteNotifier(ref.watch(userRepositoryProvider));
});
//add
final userAddNotifierProvider =
    StateNotifierProvider<UserAddNotifier, UserAddState>((ref) {
  return UserAddNotifier(ref.watch(userRepositoryProvider));
});
//update
final userUpdateNotifierProvider =
    StateNotifierProvider<UserUpdateNotifier, UserUpdateState>((ref) {
  return UserUpdateNotifier(ref.watch(userRepositoryProvider));
});

final currentUserProvider = StateProvider<UserModel?>((ref) => null);//add new