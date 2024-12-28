import 'package:dartz/dartz.dart';
import 'package:outernet/data/data_sources/local_datasouces/secure_storage.dart';
import 'package:outernet/data/data_sources/remote_datasources/auth_api_implement.dart';
import 'package:outernet/data/models/auth/auth_response_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/domain/repositories/authorization_repository.dart';
import 'package:outernet/data/models/auth/auth_request_model.dart';

class AuthorizationRepositoryImplement implements AuthorizationRepository {
  final AuthApiImplement _api;

  AuthorizationRepositoryImplement(this._api);

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password, bool rememberMe) async {
    try {
      final response = await _api.login(email, password);
      final String accessToken = response.accessToken;
      final String refreshToken = response.refreshToken;
      final BasicInfo basicInfo = response.userInfo;

      // Save token to local storage
      await SecureStorage.instance.write('token', accessToken);
      await SecureStorage.instance.write('refreshToken', refreshToken);
      await SecureStorage.instance.writeBool('isLoggedIn', true);

      UserEntity user = basicInfo.toEntity();

      return Right(user);

    } catch (e) {
      return Left(AuthorizationFailure('Invalid credentials $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(String email, String password, String name) async {
    try {
      final user = await _api.register(email, password, name);
      return Right(user.toEntity());
    } catch (e) {
      return Left(AuthorizationFailure('Invalid credentials $e'));
    }
  }

  @override
  Future<Either<Failure, String>> getOtp() async {
    try {
      final otp = await _api.getOtp();
      return Right(otp);
    } catch (e) {
      return Left(AuthorizationFailure('Failed to get OTP $e'));
    }
  }

  @override
  Future<Either<Failure, String>> verifyRegister(VerifyRegisterRequestModel request) async {
    try {
      final message = await _api.verifyRegister(request);
      return Right(message);
    } catch (e) {
      return Left(AuthorizationFailure('Failed to verify registration $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> resetPassword(ResetPasswordRequestModel request) async {
    try {
      final user = await _api.resetPassword(request);
      return Right(user.toEntity());
    } catch (e) {
      return Left(AuthorizationFailure('Failed to reset password $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> confirmResetPassword(ResetPasswordRequestModel request) async {
    try {
      final user = await _api.confirmResetPassword(request);
      return Right(user.toEntity());
    } catch (e) {
      return Left(AuthorizationFailure('Failed to confirm reset password $e'));
    }
  }

  @override
  Future<Either<Failure, String>> refreshToken() async {
    try {
      final newToken = await _api.refreshToken();
      return Right(newToken);
    } catch (e) {
      return Left(AuthorizationFailure('Failed to refresh token $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> logout() async {
    return Left(AuthorizationFailure('Invalid credentials'));
  }
}