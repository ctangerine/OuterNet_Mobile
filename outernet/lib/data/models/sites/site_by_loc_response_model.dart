import 'package:json_annotation/json_annotation.dart';
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

  SiteByLocResponseModel({
    this.siteId,
    this.siteType,
    this.name,
    this.lat,
    this.lng,
  }) {
    logger.i('SiteByLocReponseModel using for get location from site lat and long');
    logger.i(toJson());
  }

  factory SiteByLocResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SiteByLocResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SiteByLocResponseModelToJson(this);
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
}