// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_status_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSiteStatusResponseModel _$GetSiteStatusResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetSiteStatusResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => SiteData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSiteStatusResponseModelToJson(
        GetSiteStatusResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination.toJson(),
    };

SiteData _$SiteDataFromJson(Map<String, dynamic> json) => SiteData(
      siteId: (json['siteId'] as num).toInt(),
      siteVersionId: (json['siteVersionId'] as num).toInt(),
      siteName: json['siteName'] as String,
      address: json['address'] as String,
      description: json['description'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      state: json['state'] as String,
      createdAt: json['createdAt'] as String,
      actionAppliedAt: json['actionAppliedAt'] as String,
      pictureUrl: json['pictureUrl'] as String?,
      typeOfModification: json['typeOfModification'] as String,
    );

Map<String, dynamic> _$SiteDataToJson(SiteData instance) => <String, dynamic>{
      'siteId': instance.siteId,
      'siteVersionId': instance.siteVersionId,
      'siteName': instance.siteName,
      'address': instance.address,
      'description': instance.description,
      'lat': instance.lat,
      'lng': instance.lng,
      'state': instance.state,
      'createdAt': instance.createdAt,
      'actionAppliedAt': instance.actionAppliedAt,
      'pictureUrl': instance.pictureUrl,
      'typeOfModification': instance.typeOfModification,
    };
