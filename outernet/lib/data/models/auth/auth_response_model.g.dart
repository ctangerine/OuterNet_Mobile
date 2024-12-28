// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      userInfo: BasicInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'userInfo': instance.userInfo.toJson(),
    };

BasicInfo _$BasicInfoFromJson(Map<String, dynamic> json) => BasicInfo(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      socialUrl: json['socialUrl'] as String?,
      avatar: json['avatar'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$BasicInfoToJson(BasicInfo instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'fullName': instance.fullName,
      'email': instance.email,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'socialUrl': instance.socialUrl,
      'avatar': instance.avatar,
      'score': instance.score,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
