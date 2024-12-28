import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';

abstract class SiteState {}

class InitialSiteState extends SiteState {
  final List<SiteEntity>? sites;

  InitialSiteState({this.sites});
}

class LoadListSiteSuccess extends SiteState {
  final List<SiteEntity> sites;
  final SiteEntity siteDetail;
  final List<ReviewEntity> siteReview;
  final List<SiteEntity> siteByLoc;
  final List<GroupedService>? groupedServices;
  final List<SiteType>? siteTypes;

  bool? isListRecentlyChanged;
  bool? isSiteDetailChanged;
  bool? isNewlyAddedSite;
  bool? isSiteRecentlyUpdate;
  bool? isSiteRecentlyChanged;
  bool? isSiteReviewChanged;
  bool? isSiteByLocChanged;
  bool? isGotGroupedService;

  final String? message;

  LoadListSiteSuccess._({
    required this.sites,
    required this.siteDetail,
    required this.siteReview,
    required this.siteByLoc,
    this.groupedServices,
    this.siteTypes,
    this.isListRecentlyChanged = false,
    this.isSiteDetailChanged = false,
    this.isNewlyAddedSite = false,
    this.isSiteRecentlyUpdate = false,
    this.isSiteRecentlyChanged = false,
    this.isSiteReviewChanged = false,
    this.isSiteByLocChanged = false,
    this.isGotGroupedService = false,
    this.message,
  });

  factory LoadListSiteSuccess({
    required List<SiteEntity> sites,
    SiteEntity? siteDetail,
    List<ReviewEntity>? siteReview,
    List<SiteEntity>? siteByLoc,
    List<GroupedService>? groupedServices,
    List<SiteType>? siteTypes,
    bool? isListRecentlyChanged,
    bool? isSiteDetailChanged,
    bool? isNewlyAddedSite,
    bool? isSiteRecentlyUpdate,
    bool? isSiteRecentlyChanged,
    bool? isSiteReviewChanged,
    bool? isSiteByLocChanged,
    bool? isGotGroupedService,
    String? message,
  }) {
    return LoadListSiteSuccess._(
      sites: sites,
      siteDetail: siteDetail ?? SiteEntity.defaultInstance,
      siteReview: siteReview ?? <ReviewEntity>[],
      siteByLoc: siteByLoc ?? [SiteEntity.defaultInstance],
      groupedServices: groupedServices,
      siteTypes: siteTypes,
      isListRecentlyChanged: isListRecentlyChanged,
      isSiteDetailChanged: isSiteDetailChanged,
      isNewlyAddedSite: isNewlyAddedSite,
      isSiteRecentlyUpdate: isSiteRecentlyUpdate,
      isSiteRecentlyChanged: isSiteRecentlyChanged,
      isSiteReviewChanged: isSiteReviewChanged,
      isSiteByLocChanged: isSiteByLocChanged,
      isGotGroupedService: isGotGroupedService,
      message: message,
    );
  }

  // copyWith method
  LoadListSiteSuccess copyWith({
    List<SiteEntity>? sites,
    SiteEntity? siteDetail,
    List<ReviewEntity>? siteReview,
    List<SiteEntity>? siteByLoc,
    List<GroupedService>? groupedServices,
    List<SiteType>? siteTypes,
    bool? isListRecentlyChanged,
    bool? isSiteDetailChanged,
    bool? isNewlyAddedSite,
    bool? isSiteRecentlyUpdate,
    bool? isSiteRecentlyChanged,
    bool? isSiteReviewChanged,
    bool? isSiteByLocChanged,
    bool? isGotGroupedService,
    String? message,
  }) {
    return LoadListSiteSuccess(
      sites: sites ?? this.sites,
      siteDetail: siteDetail ?? this.siteDetail,
      siteReview: siteReview ?? this.siteReview,
      siteByLoc: siteByLoc ?? this.siteByLoc,
      groupedServices: groupedServices ?? this.groupedServices,
      siteTypes: siteTypes ?? this.siteTypes,
      isListRecentlyChanged: isListRecentlyChanged ?? this.isListRecentlyChanged,
      isSiteDetailChanged: isSiteDetailChanged ?? this.isSiteDetailChanged,
      isNewlyAddedSite: isNewlyAddedSite ?? this.isNewlyAddedSite,
      isSiteRecentlyUpdate: isSiteRecentlyUpdate ?? this.isSiteRecentlyUpdate,
      isSiteRecentlyChanged: isSiteRecentlyChanged ?? this.isSiteRecentlyChanged,
      isSiteReviewChanged: isSiteReviewChanged ?? this.isSiteReviewChanged,
      isSiteByLocChanged: isSiteByLocChanged ?? this.isSiteByLocChanged,
      isGotGroupedService: isGotGroupedService ?? this.isGotGroupedService,
      message: message ?? this.message,
    );
  }
}

class LoadListSiteFailed extends SiteState {
  final String message;

  LoadListSiteFailed(this.message);
}

class SiteLoading extends SiteState {}