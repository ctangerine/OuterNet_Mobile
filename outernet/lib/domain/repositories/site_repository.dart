import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/site_type/sitetype_response_model.dart';
import 'package:outernet/data/models/sites/site_by_loc_response_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/data/models/sites/site_review_response_model.dart';
import 'package:outernet/domain/entities/failure.dart';

abstract class SiteRepository {
  Future<Either<Failure, SiteResponseModel>> addNewSite(AddNewSiteRequestModel request);
  Future<Either<Failure, SiteResponseModel>> getPublicSite(int id);
  Future<Either<Failure, SiteResponseModel>> updateSiteInfor(UpdateSiteRequestModel request);
  Future<Either<Failure, SiteResponseModel>> getSiteByVersion(int version);
  Future<Either<Failure, SiteReviewResponseModel>> getSiteReview(int siteId);

  Future<Either<Failure, List<SiteResponseModel>>> getListSite();

  Future<Either<Failure, SiteTypeGroupServicesResponseModel>> getSiteTypeGroupServices();

  Future<Either<Failure, SiteByLocResponseModel>> getSiteByLocation(GetSiteRequestModel request);
}