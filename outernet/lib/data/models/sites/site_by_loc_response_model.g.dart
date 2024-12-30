// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_by_loc_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteByLocResponseModel _$SiteByLocResponseModelFromJson(
        Map<String, dynamic> json) =>
    SiteByLocResponseModel(
      siteId: (json['siteId'] as num).toInt(),
      siteType: SiteType.fromJson(json['siteType'] as Map<String, dynamic>),
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      medias: (json['medias'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      averageRating: (json['averageRating'] as num).toDouble(),
      totalRating: (json['totalRating'] as num).toInt(),
    );

Map<String, dynamic> _$SiteByLocResponseModelToJson(
        SiteByLocResponseModel instance) =>
    <String, dynamic>{
      'siteId': instance.siteId,
      'siteType': instance.siteType.toJson(),
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'medias': instance.medias.map((e) => e.toJson()).toList(),
      'averageRating': instance.averageRating,
      'totalRating': instance.totalRating,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      mediaType: json['mediaType'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'mediaType': instance.mediaType,
      'createdAt': instance.createdAt,
    };
