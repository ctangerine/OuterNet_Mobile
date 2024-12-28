import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/domain/entities/user_entity.dart';

part 'auth_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final BasicInfo userInfo;

  AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.userInfo,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => _$AuthResponseModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$AuthResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicInfo {
  final int id;
  final String? nickname;
  final String? fullName;
  final String? email;
  final String? gender;
  final String? phoneNumber;
  final String? socialUrl;
  final String? avatar;
  final double? score;
  final DateTime? createdAt;

  BasicInfo({
    required this.id,
    this.nickname,
    this.fullName,
    this.email,
    this.gender,
    this.phoneNumber,
    this.socialUrl,
    this.avatar,
    this.score,
    this.createdAt,
  });

  factory BasicInfo.fromJson(Map<String, dynamic> json) => _$BasicInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BasicInfoToJson(this);

  UserEntity toEntity() {
    final user = UserEntity.defaultInstance.copyWith(
      id: id,
      nickname: nickname,
      fullName: fullName,
      email: email,
      gender: gender,
      phoneNumber: phoneNumber,
      socialUrl: socialUrl,
      avatar: avatar,
      score: score,
      createdAt: createdAt,
    );
    return user;   
  }
}