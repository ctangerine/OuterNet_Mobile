import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/domain/entities/site_entity.dart';

part 'site_by_loc_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SiteByLocResponseModel {
  final List<Site> sites;

  SiteByLocResponseModel({
    required this.sites,
  });

  factory SiteByLocResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SiteByLocResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SiteByLocResponseModelToJson(this);

  @override
  String toString() {
    return 'SiteByLocResponseModel(sites: $sites)';
  }

  static final SiteByLocResponseModel defaultInstance = SiteByLocResponseModel(
    sites: [],
  );

  SiteByLocResponseModel copyWith({
    List<Site>? sites,
  }) {
    return SiteByLocResponseModel(
      sites: sites ?? this.sites,
    );
  }

  List<SiteEntity> toEntities() {
    final sites = this.sites.map((e) {
      final SiteEntity site = SiteEntity.defaultInstance.copyWith(
        siteId: e.siteId,
        siteType: SiteType.defaultInstance.copyWith(
          id: e.siteType.id,
          name: e.siteType.name,
          amenity: e.siteType.amenity,
          attraction: e.siteType.attraction,
        ),
        siteName: e.name,
        lat: e.lat,
        lng: e.lng,
      );

      return site;
    }).toList();

    return sites;
  }
}

@JsonSerializable(explicitToJson: true)
class Site {
  final int siteId;
  final SiteType siteType;
  final String name;
  final double lat;
  final double lng;

  Site({
    required this.siteId,
    required this.siteType,
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);

  Map<String, dynamic> toJson() => _$SiteToJson(this);

  @override
  String toString() {
    return 'Site(siteId: $siteId, siteType: $siteType, name: $name, lat: $lat, lng: $lng)';
  }

  Site copyWith({
    int? siteId,
    SiteType? siteType,
    String? name,
    double? lat,
    double? lng,
  }) {
    return Site(
      siteId: siteId ?? this.siteId,
      siteType: siteType ?? this.siteType,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  static final Site defaultInstance = Site(
    siteId: 0,
    siteType: SiteType.defaultInstance,
    name: '',
    lat: 0.0,
    lng: 0.0,
  );
}

