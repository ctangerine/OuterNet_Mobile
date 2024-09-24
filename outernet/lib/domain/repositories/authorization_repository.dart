import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthorizationRepository {
  Future<Either<Failure,UserEntity>> login(String email, String password, bool rememberMe);
  Future<Either<Failure,UserEntity>> register(String email, String password, String name);
  Future<Either<Failure,UserEntity>> forgotPassword(String email);
  Future<Either<Failure,UserEntity>> logout();
}