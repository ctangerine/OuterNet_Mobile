import 'package:dartz/dartz.dart';
import 'package:outernet/data/data_sources/remote_datasources/site_api_implement.dart';
import 'package:outernet/data/models/site_type/sitetype_response_model.dart';
import 'package:outernet/data/models/sites/site_by_loc_response_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/data/models/sites/site_review_response_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/repositories/site_repository.dart';

class SiteRepositoryImplement implements SiteRepository {
  final SiteApiImplement _api;

  SiteRepositoryImplement(this._api);
 
  @override
  Future<Either<Failure, SiteResponseModel>> addNewSite(AddNewSiteRequestModel request) async {
    try {
      final response = await _api.addNewSite(request);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to add new site $e'));
    }
  }

  @override
  Future<Either<Failure, SiteResponseModel>> getPublicSite(int id) async {
    try {
      final response = await _api.getPublicSite(id);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to fetch data $e'));
    }
  }

  @override
  Future<Either<Failure, SiteResponseModel>> updateSiteInfor(UpdateSiteRequestModel request) async {
    try {
      final response = await _api.updateSiteInfor(request);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to update site $e'));
    }
  }

  @override
  Future<Either<Failure, SiteResponseModel>> getSiteByVersion(int version) async {
    try {
      final response = await _api.getSiteByVersion(version);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to fetch data $e'));
    }
  }

  @override
  Future<Either<Failure, SiteReviewResponseModel>> getSiteReview(int siteId) async {
    try {
      final response = await _api.getSiteReview(siteId);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fial to fetch data $e'));
    }
  }

  @override
  Future<Either<Failure, List<SiteResponseModel>>> getListSite() async {
    try {
      final response = await _api.getListSite();
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to fetch data $e'));
    }
  }

  @override
  Future<Either<Failure, SiteTypeGroupServicesResponseModel>> getSiteTypeGroupServices() async {
    try {
      final response = await _api.getSiteTypeGroupServices();
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to fetch data $e'));
    }
  }

  @override
  Future<Either<Failure, List<SiteByLocResponseModel>>> getSiteByLocation(GetSiteRequestModel request) async {
    try {
      final response = await _api.getSiteByLoc(request);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to fetch data $e'));
    }
  }
}