import 'package:dartz/dartz.dart';
import 'package:outernet/data/data_sources/remote_datasources/report_api_implement.dart';
import 'package:outernet/data/models/report/report_request_model.dart';
import 'package:outernet/data/models/report/report_response_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/repositories/report_repository.dart';

class ReportRepositoryImplement implements ReportRepository {
  final ReportApiImplement remoteDataSource;

  ReportRepositoryImplement(this.remoteDataSource);

  @override
  Future<Either<Failure, CategoryResponseModel>> getSiteReportCategories() async {
    try {
      final result = await remoteDataSource.GetSiteReportCategories();
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to get site report categories: $e'));
    }
  }

  @override
  Future<Either<Failure, CategoryResponseModel>> getUserReportCategories() async {
    try {
      final result = await remoteDataSource.GetUserReportCategories();
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to get user report categories: $e'));
    }
  }

  @override
  Future<Either<Failure, CategoryResponseModel>> getSiteReviewReportCategories() async {
    try {
      final result = await remoteDataSource.GetSiteReviewReportCategories();
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to get site review report categories: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> reportSite(SiteReportRequestModel request) async {
    try {
      final result = await remoteDataSource.ReportSite(request);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to report site: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> reportUser(UserReportRequestModel request) async {
    try {
      final result = await remoteDataSource.ReportUser(request);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to report user: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> reportSiteReview(SiteReviewReportRequestModel request) async {
    try {
      final result = await remoteDataSource.ReportSiteReview(request);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to report site review: $e'));
    }
  }
}