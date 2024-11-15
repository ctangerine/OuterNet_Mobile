import 'package:dartz/dartz.dart';
import 'package:outernet/data/data_sources/database_datasources.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/domain/repositories/authorization_repository.dart';

class AuthorizationRepositoryImplement implements AuthorizationRepository {
  // ignore: unused_field
  final PostgreSQLDatasource remoteDataSource;

  AuthorizationRepositoryImplement(this.remoteDataSource);

  @override
  Future<Either<Failure,UserEntity>> login(String email, String password, bool rememberMe) async {
    try {
      final user = await remoteDataSource.login(email, password);
      return Right(user.toEntity());
    } catch (e) {
      return Left(AuthorizationFailure('Invalid credentials $e'));
    }    
  }
  
  @override
  Future<Either<Failure,UserEntity>> register(String email, String password, String name) async {
    try {
      final user = await remoteDataSource.register(email, password, name);
      return Right(user.toEntity());
    } catch (e) {
      return Left(AuthorizationFailure('Invalid credentials $e'));
    }
  }

  @override
  Future<Either<Failure,String>> getOtp() async {
    try {
      final otp = await remoteDataSource.getOtp();
      return Right(otp);
    } catch (e) {
      return Left(AuthorizationFailure('Invalid credentials $e'));
    }
  }

  @override
  Future<Either<Failure,UserEntity>> forgotPassword(String email) async {
    return Left(AuthorizationFailure('Invalid credentials'));
  }

  @override
  Future<Either<Failure,UserEntity>> logout() async {
    return Left(AuthorizationFailure('Invalid credentials'));
  }
}