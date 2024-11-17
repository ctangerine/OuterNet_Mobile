import 'dart:math';

import 'package:dio/dio.dart';
import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/data/models/auth/auth_request_model.dart';
import 'package:outernet/data/models/user/user_response_model.dart';

class AuthApiImplement {
  final Dio dio;

  AuthApiImplement(this.dio);

  // Fake api call and returning fake data
  Future<UserResponseModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      return UserResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  Future<UserResponseModel> register(String email, String password, String name) async {
    try {
      final response = await dio.post(
        ApiEndpoints.register,
        data: {
          'email': email,
          'password': password,
          'name': name,
        },
      );

      return UserResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  Future<String> verifyRegister(VerifyRegisterRequestModel request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.verifyRegister,
        data: request.toJson(),
      );

      return response.data['message'];
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  Future<UserResponseModel> resetPassword(ResetPasswordRequestModel request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.resetPassword,
        data: request.toJson(),
      );

      return UserResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  Future<UserResponseModel> confirmResetPassword(ResetPasswordRequestModel request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.resetPassword,
        data: request.toJson(),
      );

      return UserResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  Future<String> refreshToken() async {
    try {
      final response = await dio.post(
        ApiEndpoints.refreshToken,
      );

      return response.data['token'];
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  Future<String> getOtp() async {
    // Generate a random 6-digit OTP
    final random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }
}