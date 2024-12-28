// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteReviewResponseModel _$SiteReviewResponseModelFromJson(
        Map<String, dynamic> json) =>
    SiteReviewResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SiteReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SiteReviewResponseModelToJson(
        SiteReviewResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination?.toJson(),
    };

SiteReview _$SiteReviewFromJson(Map<String, dynamic> json) => SiteReview(
      id: (json['id'] as num?)?.toInt(),
      generalRating: (json['generalRating'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      isEdited: json['isEdited'] as bool?,
      likeCount: (json['likeCount'] as num?)?.toInt(),
      dislikeCount: (json['dislikeCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SiteReviewToJson(SiteReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'generalRating': instance.generalRating,
      'comment': instance.comment,
      'date': instance.date?.toIso8601String(),
      'user': instance.user?.toJson(),
      'medias': instance.medias?.map((e) => e.toJson()).toList(),
      'isEdited': instance.isEdited,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      nickname: json['nickname'] as String?,
      fullName: json['fullName'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nickname': instance.nickname,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
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

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
      itemsPerPage: (json['itemsPerPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'itemsPerPage': instance.itemsPerPage,
    };
