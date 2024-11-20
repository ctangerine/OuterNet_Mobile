import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/data/models/sites/site_review_response_model.dart';

abstract class SiteState {}

class InitialSiteState extends SiteState {
  final List<SiteResponseModel>? sites;

  InitialSiteState({this.sites});
}

class LoadListSiteSuccess extends SiteState {
  final List<SiteResponseModel> sites;
  final SiteResponseModel siteDetail;
  final SiteReviewResponseModel siteReview;

  bool? isListRecentlyChanged;
  bool? isSiteDetailChanged;
  bool? isNewlyAddedSite;
  bool? isSiteRecentlyUpdate;
  bool? isSiteRecentlyChanged;
  bool? isSiteReviewChanged;

  final String? message;

  LoadListSiteSuccess._({
    required this.sites,
    required this.siteDetail,
    required this.siteReview,
    this.isListRecentlyChanged = false,
    this.isSiteDetailChanged = false,
    this.isNewlyAddedSite = false,
    this.isSiteRecentlyUpdate = false,
    this.isSiteRecentlyChanged = false,
    this.isSiteReviewChanged = false,
    this.message,
  });

  factory LoadListSiteSuccess({
    required List<SiteResponseModel> sites,
    SiteResponseModel? siteDetail,
    SiteReviewResponseModel? siteReview,
    bool? isListRecentlyChanged,
    bool? isSiteDetailChanged,
    bool? isNewlyAddedSite,
    bool? isSiteRecentlyUpdate,
    bool? isSiteRecentlyChanged,
    bool? isSiteReviewChanged,
    String? message,
  }) {
    return LoadListSiteSuccess._(
      sites: sites,
      siteDetail: siteDetail ?? SiteResponseModel.defaultInstance,
      siteReview: siteReview ?? SiteReviewResponseModel.defaultInstance,
      isListRecentlyChanged: isListRecentlyChanged,
      isSiteDetailChanged: isSiteDetailChanged,
      isNewlyAddedSite: isNewlyAddedSite,
      isSiteRecentlyUpdate: isSiteRecentlyUpdate,
      isSiteRecentlyChanged: isSiteRecentlyChanged,
      isSiteReviewChanged: isSiteReviewChanged,
      message: message,
    );
  }

  // copyWith method
  LoadListSiteSuccess copyWith({
    List<SiteResponseModel>? sites,
    SiteResponseModel? siteDetail,
    SiteReviewResponseModel? siteReview,
    bool? isListRecentlyChanged,
    bool? isSiteDetailChanged,
    bool? isNewlyAddedSite,
    bool? isSiteRecentlyUpdate,
    bool? isSiteRecentlyChanged,
    bool? isSiteReviewChanged,
    String? message,
  }) {
    return LoadListSiteSuccess(
      sites: sites ?? this.sites,
      siteDetail: siteDetail ?? this.siteDetail,
      siteReview: siteReview ?? this.siteReview,
      isListRecentlyChanged: isListRecentlyChanged ?? this.isListRecentlyChanged,
      isSiteDetailChanged: isSiteDetailChanged ?? this.isSiteDetailChanged,
      isNewlyAddedSite: isNewlyAddedSite ?? this.isNewlyAddedSite,
      isSiteRecentlyUpdate: isSiteRecentlyUpdate ?? this.isSiteRecentlyUpdate,
      isSiteRecentlyChanged: isSiteRecentlyChanged ?? this.isSiteRecentlyChanged,
      isSiteReviewChanged: isSiteReviewChanged ?? this.isSiteReviewChanged,
      message: message ?? this.message,
    );
  }
}

class LoadListSiteFailed extends SiteState {
  final String message;

  LoadListSiteFailed(this.message);
}

class SiteLoading extends SiteState {}