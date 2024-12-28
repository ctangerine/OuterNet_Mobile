import 'package:dartz/dartz.dart';
import 'package:outernet/data/data_sources/remote_datasources/site_review_api_implement.dart';
import 'package:outernet/data/models/site_review/site_review_request_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/repositories/site_review_respository.dart';

class SiteReviewRepositoryImplement implements SiteReviewRespository {
  final SiteReviewApiImplement _api;

  SiteReviewRepositoryImplement(this._api);

  @override
  Future<Either<Failure, String>> addNewReview(ReviewSiteRequestModel request) async {
    try {
      final response = await _api.addSiteReview(request);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to add new review $e'));
    }
  }

  @override
  Future<Either<Failure, String>> updateReview(UpdateReviewRequestModel request, int reviewId) async {
    try {
      final response = await _api.updateReview(request, reviewId);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to update review $e'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteReview(int reviewId) async {
    try {
      final response = await _api.deleteReview(reviewId);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to delete review $e'));
    }
  }

  @override
  Future<Either<Failure, ReviewEntity>> getDetailReview(int reviewId) async {
    try {
      final response = await _api.getDetailReview(reviewId);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to get detail review $e'));
    }
  }

  @override
  Future<Either<Failure, List<ReviewEntity>>> getMyReview() async {
    try {
      final response = await _api.getMyReview();
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to get my review $e'));
    }
  }
}