class UserEntity {
  final String userId;
  final String name;
  final String email;
  final String? token;
  final String? phoneNumer;
  final String? profileImage;

  UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    this.token,
    this.phoneNumer,
    this.profileImage,
  });
}