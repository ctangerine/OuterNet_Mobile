// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      userId: (json['userId'] as num?)?.toInt(),
      nickname: json['nickname'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'role': instance.role,
    };

GetPlanResponseModel _$GetPlanResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetPlanResponseModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      coverUrl: json['coverUrl'] as String?,
      sites: (json['sites'] as List<dynamic>?)
              ?.map(
                  (e) => SiteResponseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetPlanResponseModelToJson(
        GetPlanResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'coverUrl': instance.coverUrl,
      'sites': instance.sites.map((e) => e.toJson()).toList(),
      'members': instance.members.map((e) => e.toJson()).toList(),
    };

GetAllPlanRequestModel _$GetAllPlanRequestModelFromJson(
        Map<String, dynamic> json) =>
    GetAllPlanRequestModel(
      plans: (json['plans'] as List<dynamic>?)
          ?.map((e) => GetPlanResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllPlanRequestModelToJson(
        GetAllPlanRequestModel instance) =>
    <String, dynamic>{
      'plans': instance.plans?.map((e) => e.toJson()).toList(),
    };
