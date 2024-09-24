import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';

abstract class AuthState {}

class InitialAuthentication extends AuthState {}

class LoadingAuthState extends AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  final UserEntity? user;

  Authenticated({this.user});
}

class AuthFailed extends AuthState {
  final Failure failure;

  AuthFailed(this.failure);
}

class LogoutSuccess extends AuthState {}

class LogoutFailed extends AuthState {
  final Failure failure;

  LogoutFailed(this.failure);
}

class RegisterSuccess extends AuthState {}

class RegisterFailed extends AuthState {
  final Failure failure;

  RegisterFailed(this.failure);
}

