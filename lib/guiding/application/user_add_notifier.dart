 import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feat_guiding.dart';
 import '../../all_feat.dart';


part 'user_add_notifier.freezed.dart';

@freezed
class UserAddState with _$UserAddState {
  const factory UserAddState.inital() = _Inital;
  const factory UserAddState.loading() = _Loading;
  const factory UserAddState.noInternet() = _NoInternet;
  const factory UserAddState.success(UserModel user) = _Success;
  const factory UserAddState.error(ResponseInfoError error) = _Error;
}

class UserAddNotifier extends StateNotifier<UserAddState> {
  final UserRepository _repository;

  UserAddNotifier(this._repository) : super(const UserAddState.inital());

  Future<void> addUser(UserModel user) async {
    state = const UserAddState.loading();

    final failOrSuccess = await _repository.addUser(user);
    state = failOrSuccess.fold(
      (l) => UserAddState.error(l),
      (r) => r.when(
        noInternet: UserAddState.noInternet,
        data: (entity) => UserAddState.success(entity),
      ),
    );
  }
} 