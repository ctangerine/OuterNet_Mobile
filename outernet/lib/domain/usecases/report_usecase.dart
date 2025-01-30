import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/report/report_request_model.dart';
import 'package:outernet/data/models/report/report_response_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/repositories/report_repository.dart';

class ReportUsecase {
  final ReportRepository _reportRepository;

  ReportUsecase(this._reportRepository);

  Future<Either<Failure, CategoryResponseModel>> getSiteReportCategories() {
    return _reportRepository.getSiteReportCategories();
  }

  Future<Either<Failure, CategoryResponseModel>> getUserReportCategories() {
    return _reportRepository.getUserReportCategories();
  }

  Future<Either<Failure, CategoryResponseModel>> getSiteReviewReportCategories() {
    return _reportRepository.getSiteReviewReportCategories();
  }

  Future<Either<Failure, String>> reportSite(SiteReportRequestModel request) {
    return _reportRepository.reportSite(request);
  }

  Future<Either<Failure, String>> reportUser(UserReportRequestModel request) {
    return _reportRepository.reportUser(request);
  }

  Future<Either<Failure, String>> reportSiteReview(SiteReviewReportRequestModel request) {
    return _reportRepository.reportSiteReview(request);
  }
}