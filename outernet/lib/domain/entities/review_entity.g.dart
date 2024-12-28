// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewEntity _$ReviewEntityFromJson(Map<String, dynamic> json) => ReviewEntity(
      id: (json['id'] as num?)?.toInt(),
      generalRating: (json['generalRating'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => MediaEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      isEdited: json['isEdited'] as bool?,
      likeCount: (json['likeCount'] as num?)?.toInt(),
      dislikeCount: (json['dislikeCount'] as num?)?.toInt(),
      userReaction: json['userReaction'] as String?,
      arrivalDate: json['arrivalDate'] == null
          ? null
          : DateTime.parse(json['arrivalDate'] as String),
    );

Map<String, dynamic> _$ReviewEntityToJson(ReviewEntity instance) =>
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
      'userReaction': instance.userReaction,
      'arrivalDate': instance.arrivalDate?.toIso8601String(),
    };
