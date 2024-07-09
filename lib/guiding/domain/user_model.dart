import 'package:freezed_annotation/freezed_annotation.dart';

import '../infrastructure/user_dto.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();//toDto
  const factory UserModel({
    required String username,
    required String address,
    required String phno,
    required DateTime createdat,
    required String id,
  }) = _UserModel;
  UserDto toDto() => UserDto(
        username : username,
        address : address,
        phno : phno,
        createdat : createdat,
        id : id,
    ); 
}
