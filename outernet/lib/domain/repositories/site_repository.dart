import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';

abstract class SiteRepository {
  Future<Either<Failure, String>> addNewSite(AddNewSiteRequestModel request);
  Future<Either<Failure, SiteEntity>> getPublicSite(int id);
  Future<Either<Failure, SiteEntity>> updateSiteInfo(UpdateSiteRequestModel request);
  Future<Either<Failure, SiteEntity>> getSiteByVersion(int version);
  Future<Either<Failure, List<ReviewEntity>>> getSiteReview(int siteId);

  Future<Either<Failure, List<SiteEntity>>> getSiteByLocation(GetSitesByAreaRequestModel request);
  Future<Either<Failure,List<GroupedService>>> getAllGroupedService(int id);
  Future<Either<Failure, List<SiteType>>> getAllSiteType();
}