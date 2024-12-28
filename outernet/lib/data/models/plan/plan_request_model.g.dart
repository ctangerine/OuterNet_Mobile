// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cover _$CoverFromJson(Map<String, dynamic> json) => Cover(
      id: json['id'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CoverToJson(Cover instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };

CreateOrUpdatePlanRequestModel _$CreateOrUpdatePlanRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateOrUpdatePlanRequestModel(
      name: json['name'] as String?,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      description: json['description'] as String?,
      cover: json['cover'] == null
          ? null
          : Cover.fromJson(json['cover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrUpdatePlanRequestModelToJson(
        CreateOrUpdatePlanRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'description': instance.description,
      'cover': instance.cover?.toJson(),
    };

ChangeMemberRoleRequestModel _$ChangeMemberRoleRequestModelFromJson(
        Map<String, dynamic> json) =>
    ChangeMemberRoleRequestModel(
      userId: (json['userId'] as num?)?.toInt(),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$ChangeMemberRoleRequestModelToJson(
        ChangeMemberRoleRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'role': instance.role,
    };

PlanSiteManagementRequestModel _$PlanSiteManagementRequestModelFromJson(
        Map<String, dynamic> json) =>
    PlanSiteManagementRequestModel(
      siteId: (json['siteId'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$PlanSiteManagementRequestModelToJson(
        PlanSiteManagementRequestModel instance) =>
    <String, dynamic>{
      'siteId': instance.siteId,
      'name': instance.name,
      'description': instance.description,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };

DeletePlanRequestModel _$DeletePlanRequestModelFromJson(
        Map<String, dynamic> json) =>
    DeletePlanRequestModel(
      planId: (json['planId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeletePlanRequestModelToJson(
        DeletePlanRequestModel instance) =>
    <String, dynamic>{
      'planId': instance.planId,
    };

AddOrRemovePlanMemberRequestModel _$AddOrRemovePlanMemberRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddOrRemovePlanMemberRequestModel(
      planId: (json['planId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddOrRemovePlanMemberRequestModelToJson(
        AddOrRemovePlanMemberRequestModel instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'userId': instance.userId,
    };

RemoveSiteFromPlanRequestModel _$RemoveSiteFromPlanRequestModelFromJson(
        Map<String, dynamic> json) =>
    RemoveSiteFromPlanRequestModel(
      planId: (json['planId'] as num?)?.toInt(),
      siteId: (json['siteId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RemoveSiteFromPlanRequestModelToJson(
        RemoveSiteFromPlanRequestModel instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'siteId': instance.siteId,
    };
