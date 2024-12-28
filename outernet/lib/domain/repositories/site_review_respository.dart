import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/site_review/site_review_request_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/review_entity.dart';

abstract class SiteReviewRespository {
  Future<Either<Failure, String>> addNewReview(ReviewSiteRequestModel request);
  Future<Either<Failure, String>> updateReview(UpdateReviewRequestModel request, int reviewId);
  Future<Either<Failure, String>> deleteReview(int reviewId);
  Future<Either<Failure, ReviewEntity>> getDetailReview(int reviewId);
  Future<Either<Failure, List<ReviewEntity>>> getMyReview();
}