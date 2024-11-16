// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteReviewResponseModel _$SiteReviewResponseModelFromJson(
        Map<String, dynamic> json) =>
    SiteReviewResponseModel(
      id: (json['id'] as num?)?.toInt(),
      generalRating: (json['generalRating'] as num?)?.toInt(),
      comment: json['comment'] as String?,
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SiteReviewResponseModelToJson(
        SiteReviewResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'generalRating': instance.generalRating,
      'comment': instance.comment,
      'medias': instance.medias,
    };

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      mediaType: json['mediaType'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'mediaType': instance.mediaType,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
