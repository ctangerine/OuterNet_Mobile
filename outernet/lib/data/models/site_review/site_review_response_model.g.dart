// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailReviewResponseModel _$DetailReviewResponseModelFromJson(
        Map<String, dynamic> json) =>
    DetailReviewResponseModel(
      id: (json['id'] as num?)?.toInt(),
      generalRating: (json['generalRating'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
      arrivalDate: json['arrivalDate'] == null
          ? null
          : DateTime.parse(json['arrivalDate'] as String),
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailReviewResponseModelToJson(
        DetailReviewResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'generalRating': instance.generalRating,
      'comment': instance.comment,
      'arrivalDate': instance.arrivalDate?.toIso8601String(),
      'medias': instance.medias?.map((e) => e.toJson()).toList(),
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

SelfReview _$SelfReviewFromJson(Map<String, dynamic> json) => SelfReview(
      id: (json['id'] as num?)?.toInt(),
      siteId: (json['siteId'] as num?)?.toInt(),
      generalRating: (json['generalRating'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      isEdited: json['isEdited'] as bool?,
      likeCount: (json['likeCount'] as num?)?.toInt(),
      dislikeCount: (json['dislikeCount'] as num?)?.toInt(),
      userReaction: json['userReaction'] as String?,
      arrivalDate: json['arrivalDate'] == null
          ? null
          : DateTime.parse(json['arrivalDate'] as String),
      site: json['site'] == null
          ? null
          : SiteResponseModel.fromJson(json['site'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SelfReviewToJson(SelfReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'siteId': instance.siteId,
      'generalRating': instance.generalRating,
      'comment': instance.comment,
      'date': instance.date?.toIso8601String(),
      'medias': instance.medias?.map((e) => e.toJson()).toList(),
      'isEdited': instance.isEdited,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'userReaction': instance.userReaction,
      'arrivalDate': instance.arrivalDate?.toIso8601String(),
      'site': instance.site?.toJson(),
    };

MyReviewsResponseModel _$MyReviewsResponseModelFromJson(
        Map<String, dynamic> json) =>
    MyReviewsResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SelfReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyReviewsResponseModelToJson(
        MyReviewsResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination?.toJson(),
    };
