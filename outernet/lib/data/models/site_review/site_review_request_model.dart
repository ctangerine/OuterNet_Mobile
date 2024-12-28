import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/env/log_service.dart';

final logger = LogService().logger;

class ReviewSiteRequestModel {
  final int? siteId;
  final String? comment;
  final double? generalRating;
  final DateTime? arrivalDate;
  final List<Media>? medias;

  ReviewSiteRequestModel({
    this.siteId,
    this.comment,
    this.generalRating,
    this.arrivalDate,
    this.medias,
  }) {
    logger.i('ReviewSiteRequestModel: using for review a site in server database');
    logger.i(toJson());
  }

  factory ReviewSiteRequestModel.fromJson(Map<String, dynamic> json) {
    var mediasFromJson = json['medias'];
    List<Media> mediasList = mediasFromJson != null ? List<Media>.from(mediasFromJson) : [];

    return ReviewSiteRequestModel(
      siteId: json['siteId'],
      comment: json['comment'],
      generalRating: json['generalRating'],
      arrivalDate: json['arrivalDate'],
      medias: mediasList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'siteId': siteId,
      'comment': comment,
      'generalRating': generalRating,
      'arrivalDate': arrivalDate,
      'medias': medias,
    };
  }
}
class UpdateReviewRequestModel {
  final String? comment;
  final double? generalRating;
  final DateTime? arrivalDate;
  final List<int>? mediaIds;
  final List<Media>? newMedias;

  UpdateReviewRequestModel({
    this.comment,
    this.generalRating,
    this.arrivalDate,
    this.mediaIds,
    this.newMedias,
  }) {
    logger.i('UpdateReviewRequestModel: using for update a review in server database');
    logger.i(toJson());
  }

  factory UpdateReviewRequestModel.fromJson(Map<String, dynamic> json) {
    var mediaIdsFromJson = json['mediaIds'];
    List<int> mediaIdsList = mediaIdsFromJson != null ? List<int>.from(mediaIdsFromJson) : [];

    var newMediasFromJson = json['newMedias'];
    List<Media> newMediasList = newMediasFromJson != null ? List<Media>.from(newMediasFromJson) : [];

    return UpdateReviewRequestModel(
      comment: json['comment'],
      generalRating: json['generalRating'],
      arrivalDate: json['arrivalDate'],
      mediaIds: mediaIdsList,
      newMedias: newMediasList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'generalRating': generalRating,
      'arrivalDate': arrivalDate,
      'mediaIds': mediaIds,
      'newMedias': newMedias,
    };
  }
}