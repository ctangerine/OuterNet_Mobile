import 'package:outernet/data/models/sites/site_request_model.dart';

abstract class SiteEvent {}

class LoadListSite extends SiteEvent {}

class LoadSiteDetail extends SiteEvent {
  final int siteId;

  LoadSiteDetail(this.siteId);
}

class AddSite extends SiteEvent {
  final AddNewSiteRequestModel site;

  AddSite(this.site);
}

class UpdateSite extends SiteEvent {
  final UpdateSiteRequestModel site;

  UpdateSite(this.site);
}

class DeleteSite extends SiteEvent {
  final int siteId;

  DeleteSite(this.siteId);
}

class GetSiteVersion extends SiteEvent {
  final int version;

  GetSiteVersion(this.version);
}

class GetSiteReview extends SiteEvent {
  final int siteId;

  GetSiteReview(this.siteId);
}

class GetSiteByLocation extends SiteEvent {
  final GetSitesByAreaRequestModel request;

  GetSiteByLocation(this.request);
}

class GetAllGroupedService extends SiteEvent {
  int id;

  GetAllGroupedService(this.id);
}

class GetAllSiteType extends SiteEvent {}

