import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/user/user_request_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> addUserName(String name);
  Future<Either<Failure, String>> changePassword(ChangePasswordRequestModel request);
  Future<Either<Failure, String>> updateAvatar(UpdateAvatarRequestModel request);
  Future<Either<Failure, String>> updateBasicInfo(UpdateBasicInfoRequestModel request);
  Future<Either<Failure, String>> updateDetailInfo(UpdateDetailInfoRequestModel request);
  Future<Either<Failure, String>> updateEmail(UpdateEmailRequestModel request);
  Future<Either<Failure, String>> deactivateAccount();
  Future<Either<Failure, UserEntity>> getUserDetail();
  Future<Either<Failure, UserEntity>> getOtherUser(int userId);
  Future<Either<Failure, List<UserEntity>>> searchUser(SearchUserRequestModel request);
}