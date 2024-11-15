import 'dart:math';

import 'package:outernet/data/models/user/user_response_model.dart';

class PostgreSQLDatasource {
  // Fake api call and returning fake data
  Future<UserResponseModel> login(String email, String password) async {
    final response = await _fakeApiCall();

    return UserResponseModel.fromJson(response);
  }

  Future<UserResponseModel> register(String email, String password, String name) async {
    final response = await _fakeApiCall();

    return UserResponseModel.fromJson(response);
  }

  Future<String> getOtp() async {
    // Generate a random 6-digit OTP
    final random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  Future<UserResponseModel> addUserName(String name) async {
    final response = await _fakeApiCall();

    return UserResponseModel.fromJson(response);
  }

  Future<Map<String, dynamic>> _fakeApiCall() async {
    await Future.delayed(const Duration(seconds: 2)); // Giả lập thời gian gọi API

    // Giả lập dữ liệu trả về từ API
    return {
      "id": '1',
      "name": "John Doe",
      "email": "johndoe@example.com",
      "token": "fake_token_123"
    };
  }
}