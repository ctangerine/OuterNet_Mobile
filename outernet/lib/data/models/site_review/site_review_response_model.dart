import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/data/models/user/user_response_model.dart';
import 'package:outernet/domain/entities/media_entity.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/env/log_service.dart';

part 'site_review_response_model.g.dart';

final logger = LogService().logger;

@JsonSerializable(explicitToJson: true)
class DetailReviewResponseModel {
  final int? id;
  final double? generalRating;
  final String? comment;
  final DateTime? arrivalDate;
  final List<Media>? medias;

  DetailReviewResponseModel({
    this.id,
    this.generalRating,
    this.comment,
    this.arrivalDate,
    this.medias,
  }) {
    logger.i('DetailReviewResponseModel: using for get a detailed review (not include site)');
    logger.i(toJson());
  }

  factory DetailReviewResponseModel.fromJson(Map<String, dynamic> json) => _$DetailReviewResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$DetailReviewResponseModelToJson(this);

  // copyWith method
  DetailReviewResponseModel copyWith({
    int? id,
    double? generalRating,
    String? comment,
    DateTime? arrivalDate,
    List<Media>? medias,
  }) {
    return DetailReviewResponseModel(
      id: id ?? this.id,
      generalRating: generalRating ?? this.generalRating,
      comment: comment ?? this.comment,
      arrivalDate: arrivalDate ?? this.arrivalDate,
      medias: medias ?? this.medias,
    );
  }

  @override
  String toString() {
    return 'DetailReviewResponseModel{id: $id, generalRating: $generalRating, comment: $comment, medias: $medias}';
  }

  static DetailReviewResponseModel get defaultInstance => DetailReviewResponseModel(
    id: 0,
    generalRating: 0,
    comment: '',
    medias: [],
  );

  ReviewEntity toEntity() {
    final review = ReviewEntity.defaultInstance.copyWith(
      id: id,
      generalRating: generalRating,
      comment: comment,
      medias: medias?.map((e) => e.toEntity()).toList(),
      date: arrivalDate,
    );

    return review;
  }
}

@JsonSerializable(explicitToJson: true)
class Media {
  final int? id;
  final String? url;
  final String? mediaType;
  final DateTime? createdAt;

  Media({
    this.id,
    this.url,
    this.mediaType,
    this.createdAt,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);

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

  @override
  String toString() {
    return 'Media{id: $id, url: $url, mediaType: $mediaType, createdAt: $createdAt}';
  }

  static Media get defaultInstance => Media(
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
class SelfReview {
  final int? id;
  final int? siteId;
  final double? generalRating;
  final String? comment;
  final DateTime? date;
  final List<Media>? medias;
  final bool? isEdited;
  final int? likeCount;
  final int? dislikeCount;
  final String? userReaction;
  final DateTime? arrivalDate;
  final SiteResponseModel? site;

  SelfReview({
    this.id,
    this.siteId,
    this.generalRating,
    this.comment,
    this.date,
    this.medias,
    this.isEdited,
    this.likeCount,
    this.dislikeCount,
    this.userReaction,
    this.arrivalDate,
    this.site,
  });

  factory SelfReview.fromJson(Map<String, dynamic> json) => _$SelfReviewFromJson(json);
  Map<String, dynamic> toJson() => _$SelfReviewToJson(this);

  SelfReview copyWith({
    int? id,
    int? siteId,
    double? generalRating,
    String? comment,
    DateTime? date,
    List<Media>? medias,
    bool? isEdited,
    int? likeCount,
    int? dislikeCount,
    String? userReaction,
    DateTime? arrivalDate,
    SiteResponseModel? site,
  }) {
    return SelfReview(
      id: id ?? this.id,
      siteId: siteId ?? this.siteId,
      generalRating: generalRating ?? this.generalRating,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      medias: medias ?? this.medias,
      isEdited: isEdited ?? this.isEdited,
      likeCount: likeCount ?? this.likeCount,
      dislikeCount: dislikeCount ?? this.dislikeCount,
      userReaction: userReaction ?? this.userReaction,
      arrivalDate: arrivalDate ?? this.arrivalDate,
      site: site ?? this.site,
    );
  }

  static SelfReview get defaultInstance => SelfReview(
    id: 0,
    siteId: 0,
    generalRating: 0,
    comment: '',
    date: DateTime.now(),
    medias: [],
    isEdited: false,
    likeCount: 0,
    dislikeCount: 0,
    userReaction: '',
    arrivalDate: DateTime.now(),
    site: SiteResponseModel.defaultInstance,
  );

  SiteEntity toEntity() {
    final siteEntity = SiteEntity.defaultInstance.copyWith(
      siteId: siteId,
      siteVersionId: site?.siteVersionId ?? 0,
      likeCount: site?.likeCount ?? 0,
      dislikeCount: site?.dislikeCount ?? 0,
      ownerId: site?.ownerId ?? 0,
      ownerUsername: site?.ownerUsername ?? '',
      siteName: site?.siteName ?? '',
      lat: site?.lat ?? 0,
      lng: site?.lng ?? 0,
      resolvedAddress: site?.resolvedAddress ?? '',
      website: site?.website ?? '',
      createdAt: site?.createdAt ?? DateTime.now(),
      siteType: site?.siteType ?? SiteType.defaultInstance,
      medias: site?.medias?.map((e) => e.toEntity()).toList() ?? [],
      averageRating: site?.averageRating ?? 0,
      totalRating: site?.totalRating ?? 0,
      reviews: [ReviewEntity.defaultInstance.copyWith(
        id: id,
        generalRating: generalRating,
        comment: comment,
        date: date,
        medias: medias?.map((e) => e.toEntity()).toList(),
        isEdited: isEdited,
        likeCount: likeCount,
        dislikeCount: dislikeCount,
        userReaction: userReaction,
        arrivalDate: arrivalDate,
      )],
    );

    return siteEntity;
  }
}

@JsonSerializable(explicitToJson: true)
class MyReviewsResponseModel {
  final List<SelfReview>? data;
  final Pagination? pagination;

  MyReviewsResponseModel({
    this.data,
    this.pagination,
  });

  factory MyReviewsResponseModel.fromJson(Map<String, dynamic> json) => _$MyReviewsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyReviewsResponseModelToJson(this);

  MyReviewsResponseModel copyWith({
    List<SelfReview>? data,
    Pagination? pagination,
  }) {
    return MyReviewsResponseModel(
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }

  static MyReviewsResponseModel get defaultInstance => MyReviewsResponseModel(
    data: [],
    pagination: Pagination.defaultInstance,
  );

  List<SiteEntity> toEntity() {
    final reviews = data?.map((e) => e.toEntity()).toList() ?? [];

    return reviews;
  }
}