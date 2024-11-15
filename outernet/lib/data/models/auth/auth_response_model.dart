import 'package:outernet/data/models/user/user_response_model.dart';

class AuthResponseModel {
  final UserResponseModel user;
  final String accessToken;
  final String refreshToken;

  AuthResponseModel({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      user: UserResponseModel.fromJson(json['user']),
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
  
  AuthResponseModel copyWith({
    UserResponseModel? user,
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthResponseModel(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}