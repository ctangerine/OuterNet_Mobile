// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteResponseModel _$SiteResponseModelFromJson(Map<String, dynamic> json) =>
    SiteResponseModel(
      siteId: (json['siteId'] as num?)?.toInt(),
      siteVersionId: (json['siteVersionId'] as num?)?.toInt(),
      ownerId: (json['ownerId'] as num?)?.toInt(),
      ownerUsername: json['ownerUsername'] as String?,
      siteName: json['siteName'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      resolvedAddress: json['resolvedAddress'] as String?,
      website: json['website'] as String?,
      createdAt: json['createdAt'] as String?,
      siteType: json['siteType'] == null
          ? null
          : SiteType.fromJson(json['siteType'] as Map<String, dynamic>),
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      groupedServices: (json['groupedServices'] as List<dynamic>?)
          ?.map((e) => GroupedService.fromJson(e as Map<String, dynamic>))
          .toList(),
      openingTimes: (json['openingTimes'] as List<dynamic>?)
          ?.map((e) => OpeningTime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SiteResponseModelToJson(SiteResponseModel instance) =>
    <String, dynamic>{
      'siteId': instance.siteId,
      'siteVersionId': instance.siteVersionId,
      'ownerId': instance.ownerId,
      'ownerUsername': instance.ownerUsername,
      'siteName': instance.siteName,
      'lat': instance.lat,
      'lng': instance.lng,
      'resolvedAddress': instance.resolvedAddress,
      'website': instance.website,
      'createdAt': instance.createdAt,
      'siteType': instance.siteType?.toJson(),
      'phoneNumbers': instance.phoneNumbers,
      'groupedServices':
          instance.groupedServices?.map((e) => e.toJson()).toList(),
      'openingTimes': instance.openingTimes?.map((e) => e.toJson()).toList(),
    };

SiteType _$SiteTypeFromJson(Map<String, dynamic> json) => SiteType(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      amenity: json['amenity'] as bool?,
      attraction: json['attraction'] as bool?,
    );

Map<String, dynamic> _$SiteTypeToJson(SiteType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amenity': instance.amenity,
      'attraction': instance.attraction,
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

OpeningTime _$OpeningTimeFromJson(Map<String, dynamic> json) => OpeningTime(
      dayOfWeek: json['dayOfWeek'] as String?,
      openTime: json['openTime'] as String?,
      closeTime: json['closeTime'] as String?,
    );

Map<String, dynamic> _$OpeningTimeToJson(OpeningTime instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
    };
