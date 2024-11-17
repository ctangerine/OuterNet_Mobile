import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/domain/entities/user_entity.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  final int id;
  final String? username;
  final String? email;
  final String? fullname;
  final String? phone;
  final String? address;
  final String? avatar;
  final String? birthday;

  UserResponseModel ({
    required this.id,
    this.username,
    this.email,
    this.fullname,
    this.phone,
    this.address,
    this.avatar,
    this.birthday
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);

  UserEntity toEntity() {
    return UserEntity(
      userId: id,
      username: username,
      email: email,
      fullname: fullname,
      phone: phone,
      address: address,
      avatar: avatar,
      birthday: birthday
    );
  }
}
