 import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../all_feat.dart';
import '../domain/user_model.dart';
import '../infrastructure/user_repository.dart';

part 'user_update_notifier.freezed.dart';

@freezed
class UserUpdateState with _$UserUpdateState {
  const factory UserUpdateState.inital() = _Inital;
  const factory UserUpdateState.loading() = _Loading;
  const factory UserUpdateState.noInternet() = _NoInternet;
  const factory UserUpdateState.success(UserModel user) = _Success;
  const factory UserUpdateState.error(ResponseInfoError error) = _Error;
}

class UserUpdateNotifier extends StateNotifier<UserUpdateState> {
  final UserRepository _repository;

  UserUpdateNotifier(this._repository) : super(const UserUpdateState.inital());

  Future<void> updateUser(UserModel user) async {
    state = const UserUpdateState.loading();

    final failOrSuccess = await _repository.updateUser(user);
    state = failOrSuccess.fold(
      (l) => UserUpdateState.error(l),
      (r) => r.when(
        noInternet: UserUpdateState.noInternet,
        data: (entity) => UserUpdateState.success(entity),
      ),
    );
  }
} 