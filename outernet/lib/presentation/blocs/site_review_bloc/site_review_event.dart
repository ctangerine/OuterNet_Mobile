import 'package:outernet/data/models/site_review/site_review_request_model.dart';

abstract class SiteReviewEvent {}

class InitializeSiteReview extends SiteReviewEvent {}

class AddReview extends SiteReviewEvent {
  final ReviewSiteRequestModel request;

  AddReview(this.request);
}

class UpdateReview extends SiteReviewEvent {
  final UpdateReviewRequestModel request;
  final int reviewId;

  UpdateReview(this.request, this.reviewId);
}

class DeleteReview extends SiteReviewEvent {
  final int reviewId;

  DeleteReview(this.reviewId);
}

class ReactReview extends SiteReviewEvent {
  final int reviewId;

  ReactReview(this.reviewId);
}

class GetDetailReview extends SiteReviewEvent {
  final int reviewId;

  GetDetailReview(this.reviewId);
}

class GetMyReview extends SiteReviewEvent {}
