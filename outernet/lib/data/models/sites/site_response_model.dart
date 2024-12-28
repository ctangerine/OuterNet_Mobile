import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/domain/entities/media_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/env/log_service.dart';


part 'site_response_model.g.dart';

final logger = LogService().logger;

@JsonSerializable(explicitToJson: true)
class SiteResponseModel {
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
  final List<Media>? medias;
  final double? averageRating;
  final int? totalRating;
  final int? fiveStarRating;
  final int? fourStarRating;
  final int? threeStarRating;
  final int? twoStarRating;
  final int? oneStarRating;

  SiteResponseModel({
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
  }) {
    logger.i('SiteResponseModel: using for get a detailed site information, responses when get publicity or get owner site');
    logger.i(toJson());
  }

  factory SiteResponseModel.fromJson(Map<String, dynamic> json) => _$SiteResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SiteResponseModelToJson(this);

  @override
  String toString() {
    return 'SiteResponseModel(siteId: $siteId, siteVersionId: $siteVersionId, likeCount: $likeCount, dislikeCount: $dislikeCount, ownerId: $ownerId, ownerUsername: $ownerUsername, siteName: $siteName, lat: $lat, lng: $lng, resolvedAddress: $resolvedAddress, website: $website, createdAt: $createdAt, siteType: $siteType, phoneNumbers: $phoneNumbers, groupedServices: $groupedServices, openingTimes: $openingTimes, medias: $medias, averageRating: $averageRating, totalRating: $totalRating, fiveStarRating: $fiveStarRating, fourStarRating: $fourStarRating, threeStarRating: $threeStarRating, twoStarRating: $twoStarRating, oneStarRating: $oneStarRating)';
  }

  SiteResponseModel copyWith({
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
    List<Media>? medias,
    double? averageRating,
    int? totalRating,
    int? fiveStarRating,
    int? fourStarRating,
    int? threeStarRating,
    int? twoStarRating,
    int? oneStarRating,
  }) {
    return SiteResponseModel(
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
    );
  }

  static final SiteResponseModel defaultInstance = SiteResponseModel(
    siteId: 0,
    siteVersionId: 0,
    likeCount: 0,
    dislikeCount: 0,
    ownerId: 0,
    ownerUsername: '',
    siteName: '',
    lat: 0.0,
    lng: 0.0,
    resolvedAddress: '',
    website: '',
    createdAt: DateTime.now(),
    siteType: SiteType.defaultInstance,
    phoneNumbers: [],
    groupedServices: [],
    openingTimes: [],
    fees: [],
    medias: [],
    averageRating: 0.0,
    totalRating: 0,
    fiveStarRating: 0,
    fourStarRating: 0,
    threeStarRating: 0,
    twoStarRating: 0,
    oneStarRating: 0,
  );

  SiteEntity toEntity() {
    final List<MediaEntity> listMediaEntity = (medias == null || medias!.isEmpty) ? [] : medias!.map((e) {
      return MediaEntity.defaultInstance.copyWith(
        id: e.id,
        url: e.url,
        mediaType: e.mediaType,
        createdAt: e.createdAt != null ? DateTime.parse(e.createdAt!) : null,
      );
    }).toList();

    final site = SiteEntity.defaultInstance.copyWith(
      siteId: siteId,
      siteVersionId: siteVersionId,
      likeCount: likeCount,
      dislikeCount: dislikeCount,
      ownerId: ownerId,
      ownerUsername: ownerUsername,
      siteName: siteName,
      lat: lat,
      lng: lng,
      resolvedAddress: resolvedAddress,
      website: website,
      createdAt: createdAt,
      siteType: siteType,
      phoneNumbers: phoneNumbers,
      groupedServices: groupedServices,
      openingTimes: openingTimes,
      fees: fees,
      medias: listMediaEntity,
      averageRating: averageRating,
      totalRating: totalRating,
      fiveStarRating: fiveStarRating,
      fourStarRating: fourStarRating,
      threeStarRating: threeStarRating,
      twoStarRating: twoStarRating,
      oneStarRating: oneStarRating,
    );

    return site;
  }
}

@JsonSerializable(explicitToJson: true)
class Media {
  final int? id;
  final String? url;
  final String? mediaType;
  final String? createdAt;

  Media({
    this.id,
    this.url,
    this.mediaType,
    this.createdAt,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);

  @override
  String toString() {
    return 'Media(id: $id, url: $url, mediaType: $mediaType, createdAt: $createdAt)';
  }

  Media copyWith({
    int? id,
    String? url,
    String? mediaType,
    String? createdAt,
  }) {
    return Media(
      id: id ?? this.id,
      url: url ?? this.url,
      mediaType: mediaType ?? this.mediaType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static final Media defaultInstance = Media(
    id: 0,
    url: '',
    mediaType: '',
    createdAt: '',
  );

  MediaEntity toEntity() {
    final media = MediaEntity.defaultInstance.copyWith(
      id: id,
      url: url,
      mediaType: mediaType,
      createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
    );

    return media;
  }
}