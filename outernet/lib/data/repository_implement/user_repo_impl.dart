import 'package:dartz/dartz.dart';
import 'package:outernet/data/data_sources/database_datasources.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/domain/repositories/user_repository.dart';

class UserRepositoryImplement implements UserRepository {
  final PostgreSQLDatasource remoteDataSource;

  UserRepositoryImplement(this.remoteDataSource);

  @override
  Future<Either<Failure,UserEntity>> addUserName(String name) async {
    try {
      final user = await remoteDataSource.addUserName(name);
      return Right(user.toEntity());
    } catch (e) {
      return Left(Failure('Invalid credentials $e'));
    }    
    //return Left(AuthorizationFailure('Invalid credentials'));
  }
  
  @override
  Future<Either<Failure,UserEntity>> changeUserProfile(String name, String email, String phone, String profileImage) async {
    // try {
    //   final user = await remoteDataSource.changeUserProfile(name, email, phone, profileImage);
    //   return Right(user.toEntity());
    // } catch (e) {
    //   return Left(UserFailure('Invalid credentials $e'));
    // }
    return Left(AuthorizationFailure('Invalid credentials'));
  }
}