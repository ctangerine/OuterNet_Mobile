// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      id: json['id'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };

Aspect _$AspectFromJson(Map<String, dynamic> json) => Aspect(
      id: (json['id'] as num?)?.toInt(),
      typeId: (json['typeId'] as num?)?.toInt(),
      aspectName: json['aspectName'] as String?,
    );

Map<String, dynamic> _$AspectToJson(Aspect instance) => <String, dynamic>{
      'id': instance.id,
      'typeId': instance.typeId,
      'aspectName': instance.aspectName,
    };

Fee _$FeeFromJson(Map<String, dynamic> json) => Fee(
      id: (json['id'] as num?)?.toInt(),
      aspect: json['aspect'] == null
          ? null
          : Aspect.fromJson(json['aspect'] as Map<String, dynamic>),
      feeLow: (json['feeLow'] as num?)?.toDouble(),
      feeHigh: (json['feeHigh'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FeeToJson(Fee instance) => <String, dynamic>{
      'id': instance.id,
      'aspect': instance.aspect?.toJson(),
      'feeLow': instance.feeLow,
      'feeHigh': instance.feeHigh,
    };

AddNewSiteRequestModel _$AddNewSiteRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddNewSiteRequestModel(
      siteName: json['siteName'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      resolvedAddress: json['resolvedAddress'] as String?,
      website: json['website'] as String?,
      typeId: (json['typeId'] as num?)?.toInt(),
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      fees: (json['fees'] as List<dynamic>?)
          ?.map((e) => Fee.fromJson(e as Map<String, dynamic>))
          .toList(),
      openingTimes: (json['openingTimes'] as List<dynamic>?)
          ?.map((e) => OpeningTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AddNewSiteRequestModelToJson(
        AddNewSiteRequestModel instance) =>
    <String, dynamic>{
      'siteName': instance.siteName,
      'lat': instance.lat,
      'lng': instance.lng,
      'resolvedAddress': instance.resolvedAddress,
      'website': instance.website,
      'typeId': instance.typeId,
      'phoneNumbers': instance.phoneNumbers,
      'services': instance.services,
      'fees': instance.fees?.map((e) => e.toJson()).toList(),
      'openingTimes': instance.openingTimes?.map((e) => e.toJson()).toList(),
      'medias': instance.medias?.map((e) => e.toJson()).toList(),
      'description': instance.description,
    };

UpdateSiteRequestModel _$UpdateSiteRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateSiteRequestModel(
      siteId: (json['siteId'] as num).toInt(),
      newSiteName: json['newSiteName'] as String?,
      newLat: (json['newLat'] as num?)?.toDouble(),
      newLng: (json['newLng'] as num?)?.toDouble(),
      newResolvedAddress: json['newResolvedAddress'] as String?,
      newWebSite: json['newWebSite'] as String?,
      newTypeId: (json['newTypeId'] as num?)?.toInt(),
      newPhoneNumbers: (json['newPhoneNumbers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      newOpeningTimes: (json['newOpeningTimes'] as List<dynamic>?)
          ?.map((e) => OpeningTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      newServices: (json['newServices'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      mediaIds: (json['mediaIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      newMedias: (json['newMedias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateSiteRequestModelToJson(
        UpdateSiteRequestModel instance) =>
    <String, dynamic>{
      'siteId': instance.siteId,
      'newSiteName': instance.newSiteName,
      'newLat': instance.newLat,
      'newLng': instance.newLng,
      'newResolvedAddress': instance.newResolvedAddress,
      'newWebSite': instance.newWebSite,
      'newTypeId': instance.newTypeId,
      'newPhoneNumbers': instance.newPhoneNumbers,
      'newOpeningTimes':
          instance.newOpeningTimes?.map((e) => e.toJson()).toList(),
      'newServices': instance.newServices,
      'mediaIds': instance.mediaIds,
      'newMedias': instance.newMedias?.map((e) => e.toJson()).toList(),
    };
