class UserEvents {}

class AddUserName extends UserEvents {
  final String name;

  AddUserName(this.name);
}

class ChangeUserProfile extends UserEvents {
  final String name;
  final String email;
  final String phone;
  final String profileImage;

  ChangeUserProfile({
    required this.name,
    required this.email,
    this.phone = "",
    this.profileImage= "",
  });
}