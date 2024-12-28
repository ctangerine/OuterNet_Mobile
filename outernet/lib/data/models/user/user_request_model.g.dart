// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequestModel _$ChangePasswordRequestModelFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordRequestModel(
      oldPassword: json['oldPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ChangePasswordRequestModelToJson(
        ChangePasswordRequestModel instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };

UpdateAvatarRequestModel _$UpdateAvatarRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateAvatarRequestModel(
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$UpdateAvatarRequestModelToJson(
        UpdateAvatarRequestModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
    };

UpdateBasicInfoRequestModel _$UpdateBasicInfoRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateBasicInfoRequestModel(
      nickname: json['nickname'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$UpdateBasicInfoRequestModelToJson(
        UpdateBasicInfoRequestModel instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'fullName': instance.fullName,
    };

UpdateDetailInfoRequestModel _$UpdateDetailInfoRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateDetailInfoRequestModel(
      gender: json['gender'] as String,
      phoneNumber: json['phoneNumber'] as String,
      birthDate: json['birthDate'] as String,
      address: json['address'] as String,
      socialUrl: json['socialUrl'] as String,
    );

Map<String, dynamic> _$UpdateDetailInfoRequestModelToJson(
        UpdateDetailInfoRequestModel instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'birthDate': instance.birthDate,
      'address': instance.address,
      'socialUrl': instance.socialUrl,
    };

UpdateEmailRequestModel _$UpdateEmailRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateEmailRequestModel(
      email: json['email'] as String,
    );

Map<String, dynamic> _$UpdateEmailRequestModelToJson(
        UpdateEmailRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

SearchUserRequestModel _$SearchUserRequestModelFromJson(
        Map<String, dynamic> json) =>
    SearchUserRequestModel(
      q: json['q'] as String,
      page: (json['page'] as num).toInt(),
    );

Map<String, dynamic> _$SearchUserRequestModelToJson(
        SearchUserRequestModel instance) =>
    <String, dynamic>{
      'q': instance.q,
      'page': instance.page,
    };
