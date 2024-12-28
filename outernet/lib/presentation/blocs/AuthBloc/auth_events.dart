abstract class AuthEvents {}

class LoginRequested extends AuthEvents {
  final String email;
  final String password;
  final bool rememberMe;

  LoginRequested(this.email, this.password, this.rememberMe);
}

class LogoutRequested extends AuthEvents {}

class RegisterRequested extends AuthEvents {
  final String email;
  final String password;
  final String name;

  RegisterRequested(this.email, this.password, this.name);
}

class CheckAuthorizationStatus extends AuthEvents {}

class ForgotPassword extends AuthEvents {
  final String email;

  ForgotPassword(this.email);
}

class TokenExpired extends AuthEvents {}

