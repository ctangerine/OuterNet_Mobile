import 'package:dio/dio.dart';
import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/domain/entities/user_entity.dart';

class UserApiImplement {
  final Dio dio;

  UserApiImplement(this.dio);

  Future<UserEntity> addUserName(String name) async {
    return UserEntity(fullname: name, userId: 1);
  }
}