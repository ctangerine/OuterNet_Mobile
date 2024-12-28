import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/domain/entities/media_entity.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/env/log_service.dart';

part 'site_review_response_model.g.dart';

final logger = LogService().logger;

@JsonSerializable(explicitToJson: true)
class SiteReviewResponseModel {
  final List<SiteReview>? data;
  final Pagination? pagination;

  SiteReviewResponseModel({this.data, this.pagination}) {
    logger.i('SiteReviewResponseModel: using for get all detailed reviews of a site');
    logger.i(toJson());
  }

  factory SiteReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SiteReviewResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SiteReviewResponseModelToJson(this);

  @override
  String toString() {
    return 'SiteReviewResponseModel(data: $data, pagination: $pagination)';
  }

  SiteReviewResponseModel copyWith({
    List<SiteReview>? data,
    Pagination? pagination,
  }) {
    return SiteReviewResponseModel(
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }

  static final SiteReviewResponseModel defaultInstance = SiteReviewResponseModel(
    data: [],
    pagination: Pagination.defaultInstance,
  );

  List<ReviewEntity> toEntities() {
    final reviews = data?.map((e) => e.toEntity()).toList() ?? [];

    return reviews;
  }
}

@JsonSerializable(explicitToJson: true)
class SiteReview {
  final int? id;
  final double? generalRating;
  final String? comment;
  final DateTime? date;
  final User? user;
  final List<Media>? medias;
  final bool? isEdited;
  final int? likeCount;
  final int? dislikeCount;

  SiteReview({
    this.id,
    this.generalRating,
    this.comment,
    this.date,
    this.user,
    this.medias,
    this.isEdited,
    this.likeCount,
    this.dislikeCount,
  });

  factory SiteReview.fromJson(Map<String, dynamic> json) =>
      _$SiteReviewFromJson(json);

  Map<String, dynamic> toJson() => _$SiteReviewToJson(this);

  @override
  String toString() {
    return 'SiteReview(id: $id, generalRating: $generalRating, comment: $comment, date: $date, user: $user, medias: $medias, isEdited: $isEdited, likeCount: $likeCount, dislikeCount: $dislikeCount)';
  }

  SiteReview copyWith({
    int? id,
    double? generalRating,
    String? comment,
    DateTime? date,
    User? user,
    List<Media>? medias,
    bool? isEdited,
    int? likeCount,
    int? dislikeCount,
  }) {
    return SiteReview(
      id: id ?? this.id,
      generalRating: generalRating ?? this.generalRating,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      user: user ?? this.user,
      medias: medias ?? this.medias,
      isEdited: isEdited ?? this.isEdited,
      likeCount: likeCount ?? this.likeCount,
      dislikeCount: dislikeCount ?? this.dislikeCount,
    );
  }

  static final SiteReview defaultInstance = SiteReview(
    id: 0,
    generalRating: 0,
    comment: '',
    date: DateTime.now(),
    user: User.defaultInstance,
    medias: [],
    isEdited: false,
    likeCount: 0,
    dislikeCount: 0,
  );

  ReviewEntity toEntity() {
    final review = ReviewEntity.defaultInstance.copyWith(
      id: id,
      generalRating: generalRating,
      comment: comment,
      date: date,
      user: user?.toEntity(),
      medias: medias?.map((e) => e.toEntity()).toList(),
      isEdited: isEdited,
      likeCount: likeCount,
      dislikeCount: dislikeCount,
    );

    return review;
  }
}

@JsonSerializable(explicitToJson: true)
class User {
  final int? id;
  final String? email;
  final String? nickname;
  final String? fullName;
  final String? avatar;

  User({this.id, this.email, this.nickname, this.fullName, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User(id: $id, email: $email, nickname: $nickname, fullName: $fullName, avatar: $avatar)';
  }

  User copyWith({
    int? id,
    String? email,
    String? nickname,
    String? fullName,
    String? avatar,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      fullName: fullName ?? this.fullName,
      avatar: avatar ?? this.avatar,
    );
  }

  static final User defaultInstance = User(
    id: 0,
    email: '',
    nickname: '',
    fullName: '',
    avatar: '',
  );

  UserEntity toEntity() {
    final user = UserEntity.defaultInstance.copyWith(
      id: id,
      email: email,
      nickname: nickname,
      fullName: fullName,
      avatar: avatar,
    );

    return user;
  }
}

@JsonSerializable(explicitToJson: true)
class Media {
  final int? id;
  final String? url;
  final String? mediaType;
  final DateTime? createdAt;

  Media({this.id, this.url, this.mediaType, this.createdAt});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);

  @override
  String toString() {
    return 'Media(id: $id, url: $url, mediaType: $mediaType, createdAt: $createdAt)';
  }

  Media copyWith({
    int? id,
    String? url,
    String? mediaType,
    DateTime? createdAt,
  }) {
    return Media(
      id: id ?? this.id,
      url: url ?? this.url,
      mediaType: mediaType ?? this.mediaType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static final Media defaultInstance = Media(
    id: 0,
    url: '',
    mediaType: '',
    createdAt: DateTime.now(),
  );

  MediaEntity toEntity() {
    final media = MediaEntity.defaultInstance.copyWith(
      id: id,
      url: url,
      mediaType: mediaType,
      createdAt: createdAt,
    );

    return media;
  }
}

@JsonSerializable(explicitToJson: true)
class Pagination {
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? itemsPerPage;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.totalItems,
    this.itemsPerPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);

  @override
  String toString() {
    return 'Pagination(currentPage: $currentPage, totalPages: $totalPages, totalItems: $totalItems, itemsPerPage: $itemsPerPage)';
  }

  Pagination copyWith({
    int? currentPage,
    int? totalPages,
    int? totalItems,
    int? itemsPerPage,
  }) {
    return Pagination(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
    );
  }

  static final Pagination defaultInstance = Pagination(
    currentPage: 1,
    totalPages: 1,
    totalItems: 0,
    itemsPerPage: 10,
  );
}