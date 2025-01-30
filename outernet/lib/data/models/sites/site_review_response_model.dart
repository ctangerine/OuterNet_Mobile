import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/domain/entities/media_entity.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';
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

@JsonSerializable(explicitToJson: true)
class Site {
  final int? siteId;
  final int? siteVersionId;
  final int? likeCount;
  final int? dislikeCount;
  final String? userReaction;
  final int? ownerId;
  final String? ownerName;
  final String? ownerProfilePicture;
  final String? siteName;
  final double? lat;
  final double? lng;
  final String? resolvedAddress;
  final String? website;
  final DateTime? createdAt;
  final SiteType? siteType;
  final String? description;
  final List<Media>? medias;
  final double? averageRating;
  final int? totalRating;

  Site({
    this.siteId,
    this.siteVersionId,
    this.likeCount,
    this.dislikeCount,
    this.userReaction,
    this.ownerId,
    this.ownerName,
    this.ownerProfilePicture,
    this.siteName,
    this.lat,
    this.lng,
    this.resolvedAddress,
    this.website,
    this.createdAt,
    this.siteType,
    this.description,
    this.medias,
    this.averageRating,
    this.totalRating,
  });

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
  Map<String, dynamic> toJson() => _$SiteToJson(this);

  @override
  String toString() {
    return 'Site(siteId: $siteId, siteVersionId: $siteVersionId, likeCount: $likeCount, dislikeCount: $dislikeCount, userReaction: $userReaction, ownerId: $ownerId, ownerName: $ownerName, ownerProfilePicture: $ownerProfilePicture, siteName: $siteName, lat: $lat, lng: $lng, resolvedAddress: $resolvedAddress, website: $website, createdAt: $createdAt, siteType: $siteType, description: $description, medias: $medias, averageRating: $averageRating, totalRating: $totalRating)';
  }

  Site copyWith({
    int? siteId,
    int? siteVersionId,
    int? likeCount,
    int? dislikeCount,
    String? userReaction,
    int? ownerId,
    String? ownerName,
    String? ownerProfilePicture,
    String? siteName,
    double? lat,
    double? lng,
    String? resolvedAddress,
    String? website,
    DateTime? createdAt,
    SiteType? siteType,
    String? description,
    List<Media>? medias,
    double? averageRating,
    int? totalRating,
  }) {
    return Site(
      siteId: siteId ?? this.siteId,
      siteVersionId: siteVersionId ?? this.siteVersionId,
      likeCount: likeCount ?? this.likeCount,
      dislikeCount: dislikeCount ?? this.dislikeCount,
      userReaction: userReaction ?? this.userReaction,
      ownerId: ownerId ?? this.ownerId,
      ownerName: ownerName ?? this.ownerName,
      ownerProfilePicture: ownerProfilePicture ?? this.ownerProfilePicture,
      siteName: siteName ?? this.siteName,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      resolvedAddress: resolvedAddress ?? this.resolvedAddress,
      website: website ?? this.website,
      createdAt: createdAt ?? this.createdAt,
      siteType: siteType ?? this.siteType,
      description: description ?? this.description,
      medias: medias ?? this.medias,
      averageRating: averageRating ?? this.averageRating,
      totalRating: totalRating ?? this.totalRating,
    );
  } 

  static final Site defaultInstance = Site(
    siteId: 0,
    siteVersionId: 0,
    likeCount: 0,
    dislikeCount: 0,
    userReaction: '',
    ownerId: 0,
    ownerName: '',
    ownerProfilePicture: '',
    siteName: '',
    lat: 0,
    lng: 0,
    resolvedAddress: '',
    website: '',
    createdAt: DateTime.now(),
    siteType: SiteType.defaultInstance,
    description: '',
    medias: [],
    averageRating: 0,
    totalRating: 0,
  );

  SiteEntity toEntity() {
    final siteEntity = SiteEntity.defaultInstance.copyWith(
      siteId: siteId,
      siteVersionId: siteVersionId,
      likeCount: likeCount,
      dislikeCount: dislikeCount,
      ownerId: ownerId,
      ownerUsername: ownerName,
      siteName: siteName,
      resolvedAddress: resolvedAddress,
      description: description,
      lat: lat,
      lng: lng,
      website: website,
      totalRating: totalRating,
      averageRating: averageRating,
      siteType: siteType,
      createdAt: createdAt,
      medias: medias?.map((e) => e.toEntity()).toList() ?? [],
      typeOfModification: siteType?.name,
    );

    return siteEntity;
  }
}


@JsonSerializable(explicitToJson: true) 
class ReviewData {
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
  final Site? site;

  ReviewData({
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

  factory ReviewData.fromJson(Map<String, dynamic> json) => _$ReviewDataFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewDataToJson(this);

  @override
  String toString() {
    return 'ReviewData(id: $id, siteId: $siteId, generalRating: $generalRating, comment: $comment, date: $date, medias: $medias, isEdited: $isEdited, likeCount: $likeCount, dislikeCount: $dislikeCount, userReaction: $userReaction, arrivalDate: $arrivalDate, site: $site)';
  }

  ReviewData copyWith({
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
    Site? site,
  }) {
    return ReviewData(
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

  static final ReviewData defaultInstance = ReviewData(
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
    site: Site.defaultInstance,
  );

  SiteEntity toEntity() {
    final site = this.site!.toEntity();
    final siteEntity = site.copyWith(
      siteId: siteId,
      likeCount: likeCount,
      dislikeCount: dislikeCount,
      medias: medias?.map((e) => e.toEntity()).toList() ?? [],
      reviews: [ReviewEntity.defaultInstance.copyWith(
        id: id,
        generalRating: generalRating,
        comment: comment,
        date: date,
        medias: medias?.map((e) => e.toEntity()).toList() ?? [],
        isEdited: isEdited,
        likeCount: likeCount,
        dislikeCount: dislikeCount,
      )],
    );

    return siteEntity;
  }

}

@JsonSerializable(explicitToJson: true)
class MyReviewsResponseModel {
  final List<ReviewData>? data;
  final Pagination? pagination;

  MyReviewsResponseModel({this.data, this.pagination});

  factory MyReviewsResponseModel.fromJson(Map<String, dynamic> json) => _$MyReviewsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyReviewsResponseModelToJson(this);

  @override
  String toString() {
    return 'MyReviewsResponseModel(data: $data, pagination: $pagination)';
  }

  MyReviewsResponseModel copyWith({
    List<ReviewData>? data,
    Pagination? pagination,
  }) {
    return MyReviewsResponseModel(
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }

  static final MyReviewsResponseModel defaultInstance = MyReviewsResponseModel(
    data: [],
    pagination: Pagination.defaultInstance,
  );

  List<SiteEntity> toEntities() {
    final reviews = data?.map((e) => e.toEntity()).toList() ?? [];

    return reviews;
  }
}