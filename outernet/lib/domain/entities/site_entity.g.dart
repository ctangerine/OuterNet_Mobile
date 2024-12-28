// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteEntity _$SiteEntityFromJson(Map<String, dynamic> json) => SiteEntity(
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
          ?.map((e) => MediaEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      totalRating: (json['totalRating'] as num?)?.toInt(),
      fiveStarRating: (json['fiveStarRating'] as num?)?.toInt(),
      fourStarRating: (json['fourStarRating'] as num?)?.toInt(),
      threeStarRating: (json['threeStarRating'] as num?)?.toInt(),
      twoStarRating: (json['twoStarRating'] as num?)?.toInt(),
      oneStarRating: (json['oneStarRating'] as num?)?.toInt(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$SiteEntityToJson(SiteEntity instance) =>
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
      'reviews': instance.reviews?.map((e) => e.toJson()).toList(),
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };
