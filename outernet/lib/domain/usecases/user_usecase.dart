import 'package:dartz/dartz.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/domain/repositories/user_repository.dart';

class UserUsecase {
  final UserRepository userRepository;

  UserUsecase(this.userRepository);

  Future<Either<Failure,UserEntity>> addUserName(String name) {
    return userRepository.addUserName(name);
  }

  Future<Either<Failure,UserEntity>> changeUserProfile(String name, String email, String phone, String profileImage) {
    return userRepository.changeUserProfile(name, email, phone, profileImage);
  }
}