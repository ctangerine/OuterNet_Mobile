// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_by_loc_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteByLocResponseModel _$SiteByLocResponseModelFromJson(
        Map<String, dynamic> json) =>
    SiteByLocResponseModel(
      siteId: (json['siteId'] as num?)?.toInt(),
      siteType: json['siteType'] == null
          ? null
          : SiteType.fromJson(json['siteType'] as Map<String, dynamic>),
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SiteByLocResponseModelToJson(
        SiteByLocResponseModel instance) =>
    <String, dynamic>{
      'siteId': instance.siteId,
      'siteType': instance.siteType?.toJson(),
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'medias': instance.medias?.map((e) => e.toJson()).toList(),
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
