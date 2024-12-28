

import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/domain/entities/media_entity.dart';
import 'package:outernet/domain/entities/user_entity.dart';

part 'review_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ReviewEntity {
  final int? id;
  final double? generalRating;
  final String? comment;
  final DateTime? date;
  final UserEntity? user;
  final List<MediaEntity>? medias;
  final bool? isEdited;
  final int? likeCount;
  final int? dislikeCount;
  final String? userReaction;
  final DateTime? arrivalDate;

  ReviewEntity({
    this.id,
    this.generalRating,
    this.comment,
    this.date,
    this.user,
    this.medias,
    this.isEdited,
    this.likeCount,
    this.dislikeCount,
    this.userReaction,
    this.arrivalDate,
  });

  factory ReviewEntity.fromJson(Map<String, dynamic> json) => _$ReviewEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewEntityToJson(this);

  ReviewEntity copyWith({
    int? id,
    double? generalRating,
    String? comment,
    DateTime? date,
    UserEntity? user,
    List<MediaEntity>? medias,
    bool? isEdited,
    int? likeCount,
    int? dislikeCount,
    String? userReaction,
    DateTime? arrivalDate,
  }) {
    return ReviewEntity(
      id: id ?? this.id,
      generalRating: generalRating ?? this.generalRating,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      user: user ?? this.user,
      medias: medias ?? this.medias,
      isEdited: isEdited ?? this.isEdited,
      likeCount: likeCount ?? this.likeCount,
      dislikeCount: dislikeCount ?? this.dislikeCount,
      userReaction: userReaction ?? this.userReaction,
      arrivalDate: arrivalDate ?? this.arrivalDate,
    );
  }

  static final ReviewEntity defaultInstance = ReviewEntity(
    id: 0,
    generalRating: 0,
    comment: '',
    date: DateTime(1970, 1, 1),
    user: UserEntity.defaultInstance,
    medias: [],
    isEdited: false,
    likeCount: 0,
    dislikeCount: 0,
    userReaction: '',
    arrivalDate: DateTime(1970, 1, 1),
  );
}