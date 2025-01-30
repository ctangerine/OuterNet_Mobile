// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteReportRequestModel _$SiteReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    SiteReportRequestModel(
      siteId: (json['siteId'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SiteReportRequestModelToJson(
        SiteReportRequestModel instance) =>
    <String, dynamic>{
      'siteId': instance.siteId,
      'categoryId': instance.categoryId,
      'description': instance.description,
    };

UserReportRequestModel _$UserReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserReportRequestModel(
      userId: (json['userId'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UserReportRequestModelToJson(
        UserReportRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'description': instance.description,
    };

SiteReviewReportRequestModel _$SiteReviewReportRequestModelFromJson(
        Map<String, dynamic> json) =>
    SiteReviewReportRequestModel(
      siteReviewId: (json['siteReviewId'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SiteReviewReportRequestModelToJson(
        SiteReviewReportRequestModel instance) =>
    <String, dynamic>{
      'siteReviewId': instance.siteReviewId,
      'categoryId': instance.categoryId,
      'description': instance.description,
    };
