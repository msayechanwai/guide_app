import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guide_app/guiding/domain/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../all_feat.dart';
import '../infrastructure/user_repository.dart';
part 'user_list_notifier.freezed.dart';
@freezed
class UserListState with _$UserListState {
  const factory UserListState.initial() = _Initial;
  const factory UserListState.loading() = _Loading;
  const factory UserListState.empty() = _Empty;
  const factory UserListState.noInternet() = _NoInternet;
  const factory UserListState.success(List<UserModel> message) = _Success;
  const factory UserListState.error(ResponseInfoError error) = _Error;
}

class UserListNotifier extends StateNotifier<UserListState> {
  final UserRepository _repository;
  UserListNotifier(this._repository)
      : super(const UserListState.initial());

    Future<void> getUserList() async {
    state = const UserListState.loading();
    final failureOrSuccess = await _repository.getUserList();
    state = failureOrSuccess.fold(
      (l) => UserListState.error(l),
      (r) => r.when(
        noInternet: UserListState.noInternet,
        data: (uList) => uList.isEmpty
            ? const UserListState.empty()
            : UserListState.success(uList),
      ),
    );
  } 
} 