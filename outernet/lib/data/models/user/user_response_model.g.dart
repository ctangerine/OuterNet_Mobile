// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserDetailResponseModel _$GetUserDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUserDetailResponseModel(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      socialUrl: json['socialUrl'] as String?,
      avatar: json['avatar'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$GetUserDetailResponseModelToJson(
        GetUserDetailResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'fullName': instance.fullName,
      'email': instance.email,
      'gender': instance.gender,
      'socialUrl': instance.socialUrl,
      'avatar': instance.avatar,
      'score': instance.score,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

UpdateAvatarResposneModel _$UpdateAvatarResposneModelFromJson(
        Map<String, dynamic> json) =>
    UpdateAvatarResposneModel(
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$UpdateAvatarResposneModelToJson(
        UpdateAvatarResposneModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
    };

SearchUserResponseModel _$SearchUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    SearchUserResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchUserResponseModelToJson(
        SearchUserResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination.toJson(),
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String?,
      fullName: json['fullName'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'itemsPerPage': instance.itemsPerPage,
    };
