import 'dart:math';

import 'package:dio/dio.dart';
import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/data/models/auth/auth_request_model.dart';
import 'package:outernet/data/models/auth/auth_response_model.dart';
import 'package:outernet/data/models/user/user_response_model.dart';

class AuthApiImplement {
  final Dio dio;

  AuthApiImplement(this.dio);

  // Fake api call and returning fake data
  Future<AuthResponseModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      return AuthResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
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

      return UserResponseModel.fromJson({
        'id': 1,
      });
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> verifyRegister(VerifyRegisterRequestModel request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.verifyRegister,
        data: request.toJson(),
      );

      return response.data['message'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserResponseModel> resetPassword(ResetPasswordRequestModel request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.resetPassword,
        data: request.toJson(),
      );

      return UserResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserResponseModel> confirmResetPassword(ResetPasswordRequestModel request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.resetPassword,
        data: request.toJson(),
      );

      return UserResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> refreshToken() async {
    try {
      final response = await dio.post(
        ApiEndpoints.refreshToken,
      );

      return response.data['token'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getOtp() async {
    // Generate a random 6-digit OTP
    final random = Random();
    return (100000 + random.nextInt(900000)).toString();
  } 
}