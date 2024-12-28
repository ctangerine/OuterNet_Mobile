// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: (json['id'] as num?)?.toInt(),
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
      role: json['role'] as String?,
      address: json['address'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
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
      'role': instance.role,
      'address': instance.address,
      'birthDate': instance.birthDate?.toIso8601String(),
    };
