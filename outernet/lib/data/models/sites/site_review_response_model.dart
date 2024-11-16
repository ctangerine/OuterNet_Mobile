import 'package:json_annotation/json_annotation.dart';

part 'site_review_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SiteReviewResponseModel {
  final List<SiteReview>? data;
  final Pagination? pagination;

  SiteReviewResponseModel({this.data, this.pagination});

  factory SiteReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SiteReviewResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SiteReviewResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SiteReview {
  final int? id;
  final int? generalRating;
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
}

@JsonSerializable()
class User {
  final int? id;
  final String? email;
  final String? nickname;
  final String? fullName;
  final String? avatar;

  User({this.id, this.email, this.nickname, this.fullName, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Media {
  final int? id;
  final String? url;
  final String? mediaType;
  final DateTime? createdAt;

  Media({this.id, this.url, this.mediaType, this.createdAt});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

@JsonSerializable()
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
}