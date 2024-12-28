import 'package:dartz/dartz.dart';
import 'package:outernet/data/data_sources/remote_datasources/site_api_implement.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/domain/repositories/site_repository.dart';

class SiteRepositoryImplement implements SiteRepository {
  final SiteApiImplement _api;

  SiteRepositoryImplement(this._api);
 
  @override
  Future<Either<Failure, String>> addNewSite(AddNewSiteRequestModel request) async {
    try {
      final response = await _api.addNewSite(request);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to add new site $e'));
    }
  }

  @override
  Future<Either<Failure, SiteEntity>> getPublicSite(int id) async {
    try {
      final response = await _api.getPublicSite(id);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to fetch data $e'));
    }
  }

  @override
  Future<Either<Failure, SiteEntity>> updateSiteInfo(UpdateSiteRequestModel request) async {
    try {
      final response = await _api.updateSiteInfor(request);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to update site $e'));
    }
  }

  @override
  Future<Either<Failure, SiteEntity>> getSiteByVersion(int version) async {
    try {
      final response = await _api.getSiteByVersion(version);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to fetch data $e'));
    }
  }

  @override
  Future<Either<Failure, List<ReviewEntity>>> getSiteReview(int siteId) async {
    try {
      final response = await _api.getSiteReview(siteId);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to fetch data $e'));
    }
  }

  @override
  Future<Either<Failure, List<SiteEntity>>> getSiteByLocation(GetSitesByAreaRequestModel request) async {
    try {
      final response = await _api.getSiteByLoc(request);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to fetch data $e'));
    }
  }

  @override
  Future<Either<Failure,List<GroupedService>>> getAllGroupedService(int id) async {
    try {
      final response = await _api.getAllServices(id);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to fetch data $e'));
    }
  }

  @override
  Future<Either<Failure, List<SiteType>>> getAllSiteType() async {
    try {
      final response = await _api.getAllSiteType();
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to fetch data $e'));
    }
  }
}