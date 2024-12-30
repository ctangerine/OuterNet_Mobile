import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/domain/repositories/site_repository.dart';

class SiteUsecase {
  final SiteRepository repository;

  SiteUsecase(this.repository);

  Future<Either<Failure,String>> addNewSite(AddNewSiteRequestModel request) {
    return repository.addNewSite(request);
  }

  Future<Either<Failure,SiteEntity>> getPublicSite(int id) {
    return repository.getPublicSite(id);
  }

  Future<Either<Failure,SiteEntity>> updateSiteInfo(UpdateSiteRequestModel request) {
    return repository.updateSiteInfo(request);
  }

  Future<Either<Failure,SiteEntity>> getSiteByVersion(int version) {
    return repository.getSiteByVersion(version);
  }

  Future<Either<Failure,List<ReviewEntity>>> getSiteReview(int siteId) {
    return repository.getSiteReview(siteId);
  }

  Future<Either<Failure, List<SiteEntity>>> getSiteByLocation(GetSitesByAreaRequestModel request) {
    return repository.getSiteByLocation(request);
  }

  Future<Either<Failure,List<GroupedService>>> getAllGroupedService(int id) {
    return repository.getAllGroupedService(id);
  }

  Future<Either<Failure, List<SiteType>>> getAllSiteType() {
    return repository.getAllSiteType();
  }

  Future<Either<Failure, List<SiteEntity>>> getDiscoverySites(int typeId) {
    return repository.getDiscoverySites(typeId);
  }
}