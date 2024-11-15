import 'package:outernet/domain/entities/user_entity.dart';

class UserResponseModel {
  final String id;
  final String name;
  final String email;
  final String? fullname;
  final String? phone;
  final String? address;
  final String? avatar;
  final String? birthday;

  UserResponseModel ({
    required this.id,
    required this.name,
    required this.email,
    this.fullname,
    this.phone,
    this.address,
    this.avatar,
    this.birthday
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      fullname: json['fullname'],
      phone: json['phone'],
      address: json['address'],
      avatar: json['avatar'],
      birthday: json['birthday'],
    );
  }

  UserEntity toEntity() {
    return UserEntity(userId: id, name: name, email: email, phoneNumer: phone, profileImage: avatar);
  }
}
