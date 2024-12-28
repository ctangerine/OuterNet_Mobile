import 'package:dartz/dartz.dart';
import 'package:outernet/data/data_sources/remote_datasources/user_api_implement.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/domain/repositories/user_repository.dart';
import 'package:outernet/data/models/user/user_request_model.dart';

class UserRepositoryImplement implements UserRepository {
  final UserApiImplement remoteDataSource;

  UserRepositoryImplement(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> addUserName(String name) async {
    try {
      final user = await remoteDataSource.addUserName(name);
      return Right(user);
    } catch (e) {
      return Left(Failure('Failed to add user name: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(ChangePasswordRequestModel request) async {
    try {
      final result = await remoteDataSource.changePassword(request);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to change password: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> updateAvatar(UpdateAvatarRequestModel request) async {
    try {
      final result = await remoteDataSource.updateAvatar(request);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to update avatar: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> updateBasicInfo(UpdateBasicInfoRequestModel request) async {
    try {
      final result = await remoteDataSource.updateBasicInfo(request);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to update basic info: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> updateDetailInfo(UpdateDetailInfoRequestModel request) async {
    try {
      final result = await remoteDataSource.updateDetailInfo(request);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to update detail info: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> updateEmail(UpdateEmailRequestModel request) async {
    try {
      final result = await remoteDataSource.updateEmail(request);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to update email: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> deactivateAccount() async {
    try {
      final result = await remoteDataSource.deactivateAccount();
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to deactivate account: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserDetail() async {
    try {
      final user = await remoteDataSource.getUserDetail();
      return Right(user);
    } catch (e) {
      return Left(Failure('Failed to get user detail: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getOtherUser(int userId) async {
    try {
      final user = await remoteDataSource.getOtherUser(userId);
      return Right(user);
    } catch (e) {
      return Left(Failure('Failed to get other user: $e'));
    }
  }

  @override 
  Future<Either<Failure, List<UserEntity>>> searchUser(SearchUserRequestModel request) async {
    try {
      final users = await remoteDataSource.searchUser(request);
      return Right(users);
    } catch (e) {
      return Left(Failure('Failed to search users: $e'));
    }
  }
}