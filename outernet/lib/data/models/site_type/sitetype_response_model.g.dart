// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sitetype_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteTypeGroupServicesResponseModel _$SiteTypeGroupServicesResponseModelFromJson(
        Map<String, dynamic> json) =>
    SiteTypeGroupServicesResponseModel(
      siteType: json['siteType'] == null
          ? null
          : SiteType.fromJson(json['siteType'] as Map<String, dynamic>),
      groupedSiteServices: (json['groupedSiteServices'] as List<dynamic>?)
          ?.map((e) => GroupedService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SiteTypeGroupServicesResponseModelToJson(
        SiteTypeGroupServicesResponseModel instance) =>
    <String, dynamic>{
      'siteType': instance.siteType?.toJson(),
      'groupedSiteServices':
          instance.groupedSiteServices?.map((e) => e.toJson()).toList(),
    };

GetAllSiteTypeResponseModel _$GetAllSiteTypeResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllSiteTypeResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SiteType.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllSiteTypeResponseModelToJson(
        GetAllSiteTypeResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination?.toJson(),
    };
