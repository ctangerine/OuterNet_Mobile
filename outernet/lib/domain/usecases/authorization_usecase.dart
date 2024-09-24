import 'package:dartz/dartz.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/domain/repositories/authorization_repository.dart';

class AuthorizationUsecase {
  final AuthorizationRepository authorizationRepository;

  AuthorizationUsecase(this.authorizationRepository);

  Future<Either<Failure,UserEntity>> login(String email, String password, bool rememberMe) {
    return authorizationRepository.login(email, password, rememberMe);
  }

  Future<Either<Failure,UserEntity>> register(String email, String password, String name) {
    return authorizationRepository.register(email, password, name);
  }

  Future<Either<Failure,UserEntity>> forgotPassword(String email) {
    return authorizationRepository.forgotPassword(email);
  }

  Future<Either<Failure,UserEntity>> logout() {
    return authorizationRepository.logout();
  }
}