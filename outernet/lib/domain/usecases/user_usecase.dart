import 'package:dartz/dartz.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/domain/repositories/user_repository.dart';
import 'package:outernet/data/models/user/user_request_model.dart';

class UserUsecase {
  final UserRepository userRepository;

  UserUsecase(this.userRepository);

  Future<Either<Failure, UserEntity>> addUserName(String name) {
    return userRepository.addUserName(name);
  }

  Future<Either<Failure, String>> changePassword(ChangePasswordRequestModel request) {
    return userRepository.changePassword(request);
  }

  Future<Either<Failure, String>> updateAvatar(UpdateAvatarRequestModel request) {
    return userRepository.updateAvatar(request);
  }

  Future<Either<Failure, String>> updateBasicInfo(UpdateBasicInfoRequestModel request) {
    return userRepository.updateBasicInfo(request);
  }

  Future<Either<Failure, String>> updateDetailInfo(UpdateDetailInfoRequestModel request) {
    return userRepository.updateDetailInfo(request);
  }

  Future<Either<Failure, String>> updateEmail(UpdateEmailRequestModel request) {
    return userRepository.updateEmail(request);
  }

  Future<Either<Failure, String>> deactivateAccount() {
    return userRepository.deactivateAccount();
  }

  Future<Either<Failure, UserEntity>> getUserDetail() {
    return userRepository.getUserDetail();
  }

  Future<Either<Failure, UserEntity>> getOtherUser(int userId) {
    return userRepository.getOtherUser(userId);
  }

  Future<Either<Failure, List<UserEntity>>> searchUser(SearchUserRequestModel request) {
    return userRepository.searchUser(request);
  }
}