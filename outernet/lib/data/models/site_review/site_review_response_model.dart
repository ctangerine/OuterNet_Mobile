import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/env/log_service.dart';

part 'site_review_response_model.g.dart';

final logger = LogService().logger;

@JsonSerializable()
class SiteReviewResponseModel {
  final int? id;
  final int? generalRating;
  final String? comment;
  final List<Media>? medias;

  SiteReviewResponseModel({
    this.id,
    this.generalRating,
    this.comment,
    this.medias,
  }) {
    logger.i('SiteReviewResponseModel: using for get a detailed review (not include site)');
    logger.i(toJson());
  }

  factory SiteReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SiteReviewResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SiteReviewResponseModelToJson(this);
}

@JsonSerializable()
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
}