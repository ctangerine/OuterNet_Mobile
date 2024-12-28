import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/domain/entities/media_entity.dart';
import 'package:outernet/domain/entities/review_entity.dart';

part 'site_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class SiteEntity {
  final int? siteId;
  final int? siteVersionId;
  final int? likeCount;
  final int? dislikeCount;
  final int? ownerId;
  final String? ownerUsername;
  final String? siteName;
  final double? lat;
  final double? lng;
  final String? resolvedAddress;
  final String? website;
  final DateTime? createdAt;
  final SiteType? siteType;
  final List<String>? phoneNumbers;
  final List<GroupedService>? groupedServices;
  final List<OpeningTime>? openingTimes;
  final List<Fee>? fees;
  final List<MediaEntity>? medias;
  final double? averageRating;
  final int? totalRating;
  final int? fiveStarRating;
  final int? fourStarRating;
  final int? threeStarRating;
  final int? twoStarRating;
  final int? oneStarRating;
  final List<ReviewEntity>? reviews;
  final DateTime? startTime;
  final DateTime? endTime;

  SiteEntity({
    this.siteId,
    this.siteVersionId,
    this.likeCount,
    this.dislikeCount,
    this.ownerId,
    this.ownerUsername,
    this.siteName,
    this.lat,
    this.lng,
    this.resolvedAddress,
    this.website,
    this.createdAt,
    this.siteType,
    this.phoneNumbers,
    this.groupedServices,
    this.openingTimes,
    this.fees,
    this.medias,
    this.averageRating,
    this.totalRating,
    this.fiveStarRating,
    this.fourStarRating,
    this.threeStarRating,
    this.twoStarRating,
    this.oneStarRating,
    this.reviews,
    this.startTime,
    this.endTime,
  });

  factory SiteEntity.fromJson(Map<String, dynamic> json) => _$SiteEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SiteEntityToJson(this);

  SiteEntity copyWith({
    int? siteId,
    int? siteVersionId,
    int? likeCount,
    int? dislikeCount,
    int? ownerId,
    String? ownerUsername,
    String? siteName,
    double? lat,
    double? lng,
    String? resolvedAddress,
    String? website,
    DateTime? createdAt,
    SiteType? siteType,
    List<String>? phoneNumbers,
    List<GroupedService>? groupedServices,
    List<OpeningTime>? openingTimes,
    List<Fee>? fees,
    List<MediaEntity>? medias,
    double? averageRating,
    int? totalRating,
    int? fiveStarRating,
    int? fourStarRating,
    int? threeStarRating,
    int? twoStarRating,
    int? oneStarRating,
    List<ReviewEntity>? reviews,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return SiteEntity(
      siteId: siteId ?? this.siteId,
      siteVersionId: siteVersionId ?? this.siteVersionId,
      likeCount: likeCount ?? this.likeCount,
      dislikeCount: dislikeCount ?? this.dislikeCount,
      ownerId: ownerId ?? this.ownerId,
      ownerUsername: ownerUsername ?? this.ownerUsername,
      siteName: siteName ?? this.siteName,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      resolvedAddress: resolvedAddress ?? this.resolvedAddress,
      website: website ?? this.website,
      createdAt: createdAt ?? this.createdAt,
      siteType: siteType ?? this.siteType,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      groupedServices: groupedServices ?? this.groupedServices,
      openingTimes: openingTimes ?? this.openingTimes,
      fees: fees ?? this.fees,
      medias: medias ?? this.medias,
      averageRating: averageRating ?? this.averageRating,
      totalRating: totalRating ?? this.totalRating,
      fiveStarRating: fiveStarRating ?? this.fiveStarRating,
      fourStarRating: fourStarRating ?? this.fourStarRating,
      threeStarRating: threeStarRating ?? this.threeStarRating,
      twoStarRating: twoStarRating ?? this.twoStarRating,
      oneStarRating: oneStarRating ?? this.oneStarRating,
      reviews: reviews ?? this.reviews,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  static final SiteEntity defaultInstance = SiteEntity(
    siteId: 0,
    siteVersionId: 0,
    likeCount: 0,
    dislikeCount: 0,
    ownerId: 0,
    ownerUsername: '',
    siteName: '',
    lat: 0,
    lng: 0,
    resolvedAddress: '',
    website: '',
    createdAt: DateTime.now(),
    siteType: SiteType.defaultInstance,
    phoneNumbers: [],
    groupedServices: [],
    openingTimes: [],
    fees: [],
    medias: [],
    averageRating: 0,
    totalRating: 0,
    fiveStarRating: 0,
    fourStarRating: 0,
    threeStarRating: 0,
    twoStarRating: 0,
    oneStarRating: 0,
    reviews: [],
    startTime: null,
    endTime: null,
  );
}

