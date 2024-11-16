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

SiteType _$SiteTypeFromJson(Map<String, dynamic> json) => SiteType(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      attraction: json['attraction'] as bool?,
      amenity: json['amenity'] as bool?,
    );

Map<String, dynamic> _$SiteTypeToJson(SiteType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'attraction': instance.attraction,
      'amenity': instance.amenity,
    };

GroupedService _$GroupedServiceFromJson(Map<String, dynamic> json) =>
    GroupedService(
      serviceGroup: json['serviceGroup'] == null
          ? null
          : ServiceGroup.fromJson(json['serviceGroup'] as Map<String, dynamic>),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupedServiceToJson(GroupedService instance) =>
    <String, dynamic>{
      'serviceGroup': instance.serviceGroup?.toJson(),
      'services': instance.services?.map((e) => e.toJson()).toList(),
    };

ServiceGroup _$ServiceGroupFromJson(Map<String, dynamic> json) => ServiceGroup(
      id: (json['id'] as num?)?.toInt(),
      serviceGroupName: json['serviceGroupName'] as String?,
    );

Map<String, dynamic> _$ServiceGroupToJson(ServiceGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serviceGroupName': instance.serviceGroupName,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: (json['id'] as num?)?.toInt(),
      serviceName: json['serviceName'] as String?,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'serviceName': instance.serviceName,
    };
