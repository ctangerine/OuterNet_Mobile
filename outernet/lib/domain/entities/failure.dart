class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class AuthorizationFailure extends Failure {
  AuthorizationFailure(super.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}