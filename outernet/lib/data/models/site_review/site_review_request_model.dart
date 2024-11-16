import 'package:outernet/env/log_service.dart';

final logger = LogService().logger;

class Review {
  final int? siteId;
  final String? comment;
  final int? generalRating;

  Review({
    this.siteId,
    this.comment,
    this.generalRating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      siteId: json['siteId'],
      comment: json['comment'],
      generalRating: json['generalRating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'siteId': siteId,
      'comment': comment,
      'generalRating': generalRating,
    };
  }
}

class SiteReviewRequestModel {
  final Review? review;
  final List<String>? images;
  final List<String>? videos;

  SiteReviewRequestModel({
    this.review,
    this.images,
    this.videos,
  }) {
    logger.i('SiteReviewRequestModel: using for create new site review with images and videos in server database');
    logger.i(toJson());
  }

  factory SiteReviewRequestModel.fromJson(Map<String, dynamic> json) {
    var imagesFromJson = json['images'];
    List<String> imagesList = imagesFromJson != null ? List<String>.from(imagesFromJson) : [];

    var videosFromJson = json['videos'];
    List<String> videosList = videosFromJson != null ? List<String>.from(videosFromJson) : [];

    return SiteReviewRequestModel(
      review: json['review'] != null ? Review.fromJson(json['review']) : null,
      images: imagesList,
      videos: videosList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'review': review?.toJson(),
      'images': images,
      'videos': videos,
    };
  }
}