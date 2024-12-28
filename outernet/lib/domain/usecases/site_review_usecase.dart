import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/site_review/site_review_request_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/repositories/site_review_respository.dart';

class SiteReviewUsecase {
  final SiteReviewRespository repository;

  SiteReviewUsecase(this.repository);

  Future<Either<Failure,String>> addNewReview(ReviewSiteRequestModel review) {
    return repository.addNewReview(review);
  }

  Future<Either<Failure,String>> updateReview(UpdateReviewRequestModel review, int reviewId) {
    return repository.updateReview(review, reviewId);
  }

  Future<Either<Failure,String>> deleteReview(int reviewId) {
    return repository.deleteReview(reviewId);
  }

  Future<Either<Failure,ReviewEntity>> getDetailReview(int reviewId) {
    return repository.getDetailReview(reviewId);
  }

  Future<Either<Failure,List<ReviewEntity>>> getMyReview() {
    return repository.getMyReview();
  }
}