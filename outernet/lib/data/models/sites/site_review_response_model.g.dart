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

Site _$SiteFromJson(Map<String, dynamic> json) => Site(
      siteId: (json['siteId'] as num?)?.toInt(),
      siteVersionId: (json['siteVersionId'] as num?)?.toInt(),
      likeCount: (json['likeCount'] as num?)?.toInt(),
      dislikeCount: (json['dislikeCount'] as num?)?.toInt(),
      userReaction: json['userReaction'] as String?,
      ownerId: (json['ownerId'] as num?)?.toInt(),
      ownerName: json['ownerName'] as String?,
      ownerProfilePicture: json['ownerProfilePicture'] as String?,
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
      description: json['description'] as String?,
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      totalRating: (json['totalRating'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SiteToJson(Site instance) => <String, dynamic>{
      'siteId': instance.siteId,
      'siteVersionId': instance.siteVersionId,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'userReaction': instance.userReaction,
      'ownerId': instance.ownerId,
      'ownerName': instance.ownerName,
      'ownerProfilePicture': instance.ownerProfilePicture,
      'siteName': instance.siteName,
      'lat': instance.lat,
      'lng': instance.lng,
      'resolvedAddress': instance.resolvedAddress,
      'website': instance.website,
      'createdAt': instance.createdAt?.toIso8601String(),
      'siteType': instance.siteType?.toJson(),
      'description': instance.description,
      'medias': instance.medias?.map((e) => e.toJson()).toList(),
      'averageRating': instance.averageRating,
      'totalRating': instance.totalRating,
    };

ReviewData _$ReviewDataFromJson(Map<String, dynamic> json) => ReviewData(
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
          : Site.fromJson(json['site'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewDataToJson(ReviewData instance) =>
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
          ?.map((e) => ReviewData.fromJson(e as Map<String, dynamic>))
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
