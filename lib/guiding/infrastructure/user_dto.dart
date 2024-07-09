import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/shared/utils.dart';
import '../domain/user_model.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const UserDto._();
  const factory UserDto({
    @JsonKey(name: "username", fromJson: stringFromJson)
    required String username,
    @JsonKey(name: "address", fromJson: stringFromJson) required String address,
    @JsonKey(name: "phno", fromJson: stringFromJson) required String phno,
    @JsonKey(name: "createdat", fromJson: dateTimeFromJson) required DateTime createdat,
    @JsonKey(name: "id", fromJson: stringFromJson) required String id,
  }) =_UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  // get method
  UserModel get domain => UserModel(
        username : username,
        address : address,
        phno : phno,
        createdat : createdat,
        id : id,
      );

  // normal method
  UserModel toDomain() => UserModel(
        username : username,
        address : address,
        phno : phno,
        createdat : createdat,
        id : id,
      );
}