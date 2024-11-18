import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/env/log_service.dart';

part 'site_review_response_model.g.dart';

final logger = LogService().logger;

@JsonSerializable()
class DetailReviewResponseModel {
  final int? id;
  final int? generalRating;
  final String? comment;
  final List<Media>? medias;

  DetailReviewResponseModel({
    this.id,
    this.generalRating,
    this.comment,
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
    int? generalRating,
    String? comment,
    List<Media>? medias,
  }) {
    return DetailReviewResponseModel(
      id: id ?? this.id,
      generalRating: generalRating ?? this.generalRating,
      comment: comment ?? this.comment,
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
}