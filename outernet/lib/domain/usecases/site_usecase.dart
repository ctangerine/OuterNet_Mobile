import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/sites/site_by_loc_response_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/data/models/sites/site_review_response_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/repositories/site_repository.dart';

class SiteUsecase {
  final SiteRepository repository;

  SiteUsecase(this.repository);

  Future<Either<Failure,SiteResponseModel>> addNewSite(AddNewSiteRequestModel request) {
    return repository.addNewSite(request);
  }

  Future<Either<Failure,SiteResponseModel>> getPublicSite(int id) {
    return repository.getPublicSite(id);
  }

  Future<Either<Failure,SiteResponseModel>> updateSiteInfor(UpdateSiteRequestModel request) {
    return repository.updateSiteInfor(request);
  }

  Future<Either<Failure,SiteResponseModel>> getSiteByVersion(int version) {
    return repository.getSiteByVersion(version);
  }

  Future<Either<Failure,SiteReviewResponseModel>> getSiteReview(int siteId) {
    return repository.getSiteReview(siteId);
  }

  Future<Either<Failure,List<SiteResponseModel>>> getListSite() {
    return repository.getListSite();
  }

  Future<Either<Failure, SiteByLocResponseModel>> getSiteByLocation(GetSiteRequestModel request) {
    return repository.getSiteByLocation(request);
  }
}