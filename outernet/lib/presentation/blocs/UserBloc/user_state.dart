import 'package:outernet/domain/entities/user_entity.dart';

abstract class UserState {}

class InitalUser extends UserState {}

class UserLogedIn extends UserState {
  final UserEntity user;
  List<UserEntity>? users;

  final String? error;
  final String? message;

  bool? isPasswordChanged;
  bool? isAvatarChanged;
  bool? isBasicInfoChanged;
  bool? isProfileChanged;
  bool? isEmailChanged;
  bool? isDeactivated;
  bool? isUserSearched;

  UserLogedIn._({
    required this.user,
    this.users,
    this.error = '',
    this.message = '',
    this.isPasswordChanged = false,
    this.isAvatarChanged = false,
    this.isBasicInfoChanged = false,
    this.isProfileChanged = false,
    this.isEmailChanged = false,
    this.isDeactivated = false,
    this.isUserSearched = false,
  });

  factory UserLogedIn({
    required UserEntity user,
    List<UserEntity>? users, 
    String? error,
    String? message,
    bool? isPasswordChanged,
    bool? isAvatarChanged,
    bool? isBasicInfoChanged,
    bool? isProfileChanged,
    bool? isEmailChanged,
    bool? isDeactivated,
    bool? isUserSearched,
  }) {
    return UserLogedIn._(
      user: user,
      users: users,
      error: error,
      message: message,
      isPasswordChanged: isPasswordChanged,
      isAvatarChanged: isAvatarChanged,
      isBasicInfoChanged: isBasicInfoChanged,
      isProfileChanged: isProfileChanged,
      isEmailChanged: isEmailChanged,
      isDeactivated: isDeactivated,
      isUserSearched: isUserSearched,
    );
  }

  UserLogedIn copyWith({
    UserEntity? user,
    List<UserEntity>? users,
    String? error,
    String? message,
    bool? isPasswordChanged,
    bool? isAvatarChanged,
    bool? isBasicInfoChanged,
    bool? isProfileChanged,
    bool? isEmailChanged,
    bool? isDeactivated,
    bool? isUserSearched,
  }) {
    return UserLogedIn(
      user: user ?? this.user,
      users: users ?? this.users,
      error: error,
      message: message,
      isPasswordChanged: isPasswordChanged,
      isAvatarChanged: isAvatarChanged,
      isBasicInfoChanged: isBasicInfoChanged,
      isProfileChanged: isProfileChanged,
      isEmailChanged: isEmailChanged,
      isDeactivated: isDeactivated,
      isUserSearched: isUserSearched,
    );
  }
}

class LoadUserFailed extends UserState {
  final String message;

  LoadUserFailed(this.message);
}