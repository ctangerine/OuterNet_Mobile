// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_by_loc_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteByLocResponseModel _$SiteByLocResponseModelFromJson(
        Map<String, dynamic> json) =>
    SiteByLocResponseModel(
      sites: (json['sites'] as List<dynamic>)
          .map((e) => Site.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SiteByLocResponseModelToJson(
        SiteByLocResponseModel instance) =>
    <String, dynamic>{
      'sites': instance.sites.map((e) => e.toJson()).toList(),
    };

Site _$SiteFromJson(Map<String, dynamic> json) => Site(
      siteId: (json['siteId'] as num).toInt(),
      siteType: SiteType.fromJson(json['siteType'] as Map<String, dynamic>),
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$SiteToJson(Site instance) => <String, dynamic>{
      'siteId': instance.siteId,
      'siteType': instance.siteType.toJson(),
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
    };
