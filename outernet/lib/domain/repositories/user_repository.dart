import 'package:dartz/dartz.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure,UserEntity>> addUserName(String name);
  Future<Either<Failure,UserEntity>> changeUserProfile(String name, String email, String phone, String profileImage);
}