class UserEntity {
  final int userId;
  final String? name;
  final String? email;
  final String? token;
  final String? phoneNumer;
  final String? profileImage;

  UserEntity({
    required this.userId,
    this.name,
    this.email,
    this.token,
    this.phoneNumer,
    this.profileImage,
  });
}