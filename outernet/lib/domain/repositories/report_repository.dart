import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/report/report_request_model.dart';
import 'package:outernet/data/models/report/report_response_model.dart';
import 'package:outernet/domain/entities/failure.dart';

abstract class ReportRepository {
  Future<Either<Failure, CategoryResponseModel>> getSiteReportCategories();
  Future<Either<Failure, CategoryResponseModel>> getUserReportCategories();
  Future<Either<Failure, CategoryResponseModel>> getSiteReviewReportCategories();
  Future<Either<Failure, String>> reportSite(SiteReportRequestModel request);
  Future<Either<Failure, String>> reportUser(UserReportRequestModel request);
  Future<Either<Failure, String>> reportSiteReview(SiteReviewReportRequestModel request);
}