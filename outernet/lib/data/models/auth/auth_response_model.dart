import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final BasicInfo basicInfo;

  AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.basicInfo,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => _$AuthResponseModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$AuthResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicInfo {
  final int id;
  final String? fullName;
  final String? email;
  final String? username;
  final String? avatar;

  BasicInfo({
    required this.id,
    this.fullName,
    this.email,
    this.username,
    this.avatar,
  });

  factory BasicInfo.fromJson(Map<String, dynamic> json) => _$BasicInfoFromJson(json);

  Map<dynamic, dynamic> toJson() => _$BasicInfoToJson(this);
}