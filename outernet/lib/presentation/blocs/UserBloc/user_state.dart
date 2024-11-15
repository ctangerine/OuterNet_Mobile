import 'package:outernet/domain/entities/user_entity.dart';

abstract class UserState {}

class InitalUser extends UserState {}

class UserLogedIn extends UserState {
  final UserEntity user;

  UserLogedIn({required this.user});

  UserLogedIn copyWith({UserEntity? user}) {
    return UserLogedIn(
      user: user ?? this.user,
    );
  }
}

class LoadUserFailed extends UserState {
  final String message;

  LoadUserFailed(this.message);
}