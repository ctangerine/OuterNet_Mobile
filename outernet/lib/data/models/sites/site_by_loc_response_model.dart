import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/env/log_service.dart';

part 'site_by_loc_response_model.g.dart';

final logger = LogService().logger;

@JsonSerializable(explicitToJson: true)
class SiteByLocResponseModel {
  final int? siteId;
  final SiteType? siteType;
  final String? name;
  final double? lat;
  final double? lng;
  final List<Media>? medias;

  SiteByLocResponseModel({
    this.siteId,
    this.siteType,
    this.name,
    this.lat,
    this.lng,
    this.medias
  }) {
    logger.i('SiteByLocReponseModel using for get location from site lat and long');
    logger.i(toJson());
  }

  factory SiteByLocResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SiteByLocResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SiteByLocResponseModelToJson(this);

  @override
  String toString() {
    return 'SiteByLocResponseModel(siteId: $siteId, siteType: $siteType, name: $name, lat: $lat, lng: $lng)';
  }

  SiteByLocResponseModel copyWith({
    int? siteId,
    SiteType? siteType,
    String? name,
    double? lat,
    double? lng,
    List<Media>? medias,
  }) {
    return SiteByLocResponseModel(
      siteId: siteId ?? this.siteId,
      siteType: siteType ?? this.siteType,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      medias: medias ?? this.medias,
    );
  }

  static final SiteByLocResponseModel defaultInstance = SiteByLocResponseModel(
    siteId: 0,
    siteType: SiteType.defaultInstance,
    name: '',
    lat: 0.0,
    lng: 0.0,
  );
}

@JsonSerializable()
class SiteType {
  final int? id;
  final String? name;
  final bool? amenity;
  final bool? attraction;

  SiteType({
    this.id,
    this.name,
    this.amenity,
    this.attraction,
  });

  factory SiteType.fromJson(Map<String, dynamic> json) => _$SiteTypeFromJson(json);
  Map<String, dynamic> toJson() => _$SiteTypeToJson(this);

  @override
  String toString() {
    return 'SiteType(id: $id, name: $name, amenity: $amenity, attraction: $attraction)';
  }

  SiteType copyWith({
    int? id,
    String? name,
    bool? amenity,
    bool? attraction,
  }) {
    return SiteType(
      id: id ?? this.id,
      name: name ?? this.name,
      amenity: amenity ?? this.amenity,
      attraction: attraction ?? this.attraction,
    );
  }

  static final SiteType defaultInstance = SiteType(
    id: 0,
    name: '',
    amenity: false,
    attraction: false,
  );
}