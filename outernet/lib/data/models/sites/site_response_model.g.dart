// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteResponseModel _$SiteResponseModelFromJson(Map<String, dynamic> json) =>
    SiteResponseModel(
      siteId: (json['siteId'] as num?)?.toInt(),
      siteVersionId: (json['siteVersionId'] as num?)?.toInt(),
      likeCount: (json['likeCount'] as num?)?.toInt(),
      dislikeCount: (json['dislikeCount'] as num?)?.toInt(),
      ownerId: (json['ownerId'] as num?)?.toInt(),
      ownerUsername: json['ownerUsername'] as String?,
      siteName: json['siteName'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      resolvedAddress: json['resolvedAddress'] as String?,
      website: json['website'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
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
      fees: (json['fees'] as List<dynamic>?)
          ?.map((e) => Fee.fromJson(e as Map<String, dynamic>))
          .toList(),
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      totalRating: (json['totalRating'] as num?)?.toInt(),
      fiveStarRating: (json['fiveStarRating'] as num?)?.toInt(),
      fourStarRating: (json['fourStarRating'] as num?)?.toInt(),
      threeStarRating: (json['threeStarRating'] as num?)?.toInt(),
      twoStarRating: (json['twoStarRating'] as num?)?.toInt(),
      oneStarRating: (json['oneStarRating'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SiteResponseModelToJson(SiteResponseModel instance) =>
    <String, dynamic>{
      'siteId': instance.siteId,
      'siteVersionId': instance.siteVersionId,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'ownerId': instance.ownerId,
      'ownerUsername': instance.ownerUsername,
      'siteName': instance.siteName,
      'lat': instance.lat,
      'lng': instance.lng,
      'resolvedAddress': instance.resolvedAddress,
      'website': instance.website,
      'createdAt': instance.createdAt?.toIso8601String(),
      'siteType': instance.siteType?.toJson(),
      'phoneNumbers': instance.phoneNumbers,
      'groupedServices':
          instance.groupedServices?.map((e) => e.toJson()).toList(),
      'openingTimes': instance.openingTimes?.map((e) => e.toJson()).toList(),
      'fees': instance.fees?.map((e) => e.toJson()).toList(),
      'medias': instance.medias?.map((e) => e.toJson()).toList(),
      'averageRating': instance.averageRating,
      'totalRating': instance.totalRating,
      'fiveStarRating': instance.fiveStarRating,
      'fourStarRating': instance.fourStarRating,
      'threeStarRating': instance.threeStarRating,
      'twoStarRating': instance.twoStarRating,
      'oneStarRating': instance.oneStarRating,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      mediaType: json['mediaType'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'mediaType': instance.mediaType,
      'createdAt': instance.createdAt,
    };

DiscoverResponseModel _$DiscoverResponseModelFromJson(
        Map<String, dynamic> json) =>
    DiscoverResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SiteResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DiscoverResponseModelToJson(
        DiscoverResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination?.toJson(),
    };
