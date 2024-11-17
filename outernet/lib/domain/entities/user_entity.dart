class UserEntity {
  final int userId;
  final String? username;
  final String? email;
  final String? fullname;
  final String? phone;
  final String? avatar;
  final String? birthday;
  final String? address;

  UserEntity({
    required this.userId,
    this.username,
    this.email,
    this.fullname,
    this.phone,
    this.avatar,
    this.birthday,
    this.address,
  });
}