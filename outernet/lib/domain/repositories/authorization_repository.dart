import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/auth/auth_request_model.dart';

abstract class AuthorizationRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password, bool rememberMe);
  Future<Either<Failure, UserEntity>> register(String email, String password, String name);
  Future<Either<Failure, String>> getOtp();
  Future<Either<Failure, String>> verifyRegister(VerifyRegisterRequestModel request);
  Future<Either<Failure, UserEntity>> resetPassword(ResetPasswordRequestModel request);
  Future<Either<Failure, UserEntity>> confirmResetPassword(ResetPasswordRequestModel request);
  Future<Either<Failure, String>> refreshToken();
  Future<Either<Failure, UserEntity>> logout();
}