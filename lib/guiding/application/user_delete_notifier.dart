import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../all_feat.dart';
import '../infrastructure/user_repository.dart';

part 'user_delete_notifier.freezed.dart';

@freezed
class UserDeleteState with _$UserDeleteState {
  const factory UserDeleteState.initial() = _Initial;
  const factory UserDeleteState.loading() = _Loading;
  const factory UserDeleteState.noInternet() = _NoInternet;
  const factory UserDeleteState.success(String msg) = _Success;
  const factory UserDeleteState.error(ResponseInfoError error) = _Error;
}

class UserDeleteNotifier extends StateNotifier<UserDeleteState> {
  final UserRepository _repository;

  UserDeleteNotifier(this._repository) : super(const UserDeleteState.initial());

   Future<void> deleteUser(String id) async {
    state = const UserDeleteState.loading();
    final failureOrSuccess = await _repository.deleteUser(id);
    state = failureOrSuccess.fold(
      (l) => UserDeleteState.error(l),
      (r) => r.when(
        noInternet: UserDeleteState.noInternet,
        data: (str) => const UserDeleteState.success("Delete Success !"),
      ),
    ); 
  }
}