import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';

abstract class SiteReviewState {}

class InitialSiteReviewState extends SiteReviewState {
  final List<ReviewEntity>? reviews;

  InitialSiteReviewState({this.reviews});
}

class SiteReviewFetchSuccess extends SiteReviewState {
  final List<ReviewEntity> reviews;
  final List<SiteEntity> sites;
  final ReviewEntity? specificReview;
  final SiteEntity? specificSite;

  bool? isRecentlyAddReview;
  bool? isRecentlyUpdateReview;
  bool? isRecentlyDeleteReview;
  bool? isRecentlyLikeReview;
  bool? isRecentlyDislikeReview;
  bool? isRecentlyGetMyReview;
  bool? isRecentlyGetDetailReview;

  final String? message;
  final String? error;

  SiteReviewFetchSuccess._({
    required this.reviews,
    required this.sites,
    this.specificReview,
    this.specificSite,
    this.isRecentlyAddReview = false,
    this.isRecentlyUpdateReview = false,
    this.isRecentlyDeleteReview = false,
    this.isRecentlyLikeReview = false,
    this.isRecentlyDislikeReview = false,
    this.isRecentlyGetMyReview = false,
    this.isRecentlyGetDetailReview = false,
    this.message,
    this.error,
  });

  factory SiteReviewFetchSuccess({
    required List<ReviewEntity> reviews,
    List<SiteEntity>? sites,
    ReviewEntity? specificReview,
    SiteEntity? specificSite,
    bool? isRecentlyAddReview,
    bool? isRecentlyUpdateReview,
    bool? isRecentlyDeleteReview,
    bool? isRecentlyLikeReview,
    bool? isRecentlyDislikeReview,
    bool? isRecentlyGetMyReview,
    bool? isRecentlyGetDetailReview,
    String? message,
    String? error,
  }) {
    return SiteReviewFetchSuccess._(
      reviews: reviews,
      sites: sites ?? <SiteEntity>[],
      specificReview: specificReview,
      specificSite: specificSite,
      isRecentlyAddReview: isRecentlyAddReview,
      isRecentlyUpdateReview: isRecentlyUpdateReview,
      isRecentlyDeleteReview: isRecentlyDeleteReview,
      isRecentlyLikeReview: isRecentlyLikeReview,
      isRecentlyDislikeReview: isRecentlyDislikeReview,
      isRecentlyGetMyReview: isRecentlyGetMyReview,
      isRecentlyGetDetailReview: isRecentlyGetDetailReview,
      message: message,
      error: error,
    );
  }

  SiteReviewFetchSuccess copyWith({
    List<ReviewEntity>? reviews,
    List<SiteEntity>? sites,
    ReviewEntity? specificReview,
    SiteEntity? specificSite,
    bool? isRecentlyAddReview,
    bool? isRecentlyUpdateReview,
    bool? isRecentlyDeleteReview,
    bool? isRecentlyLikeReview,
    bool? isRecentlyDislikeReview,
    bool? isRecentlyGetMyReview,
    bool? isRecentlyGetDetailReview,
    String? message,
    String? error,
  }) {
    return SiteReviewFetchSuccess._(
      reviews: reviews ?? this.reviews,
      sites: sites ?? this.sites,
      specificReview: specificReview ?? this.specificReview,
      specificSite: specificSite ?? this.specificSite,
      isRecentlyAddReview: isRecentlyAddReview ?? this.isRecentlyAddReview,
      isRecentlyUpdateReview: isRecentlyUpdateReview ?? this.isRecentlyUpdateReview,
      isRecentlyDeleteReview: isRecentlyDeleteReview ?? this.isRecentlyDeleteReview,
      isRecentlyLikeReview: isRecentlyLikeReview ?? this.isRecentlyLikeReview,
      isRecentlyDislikeReview: isRecentlyDislikeReview ?? this.isRecentlyDislikeReview,
      isRecentlyGetMyReview: isRecentlyGetMyReview ?? this.isRecentlyGetMyReview,
      isRecentlyGetDetailReview: isRecentlyGetDetailReview ?? this.isRecentlyGetDetailReview,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }
}


class SiteReviewFetchFailure extends SiteReviewState {
  final String error;

  SiteReviewFetchFailure(this.error);
}