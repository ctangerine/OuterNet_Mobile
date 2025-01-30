import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/data/models/user/user_response_model.dart';
import 'package:outernet/domain/entities/media_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';

part 'site_status_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetSiteStatusResponseModel {
  final List<SiteData> data;
  final Pagination pagination;

  GetSiteStatusResponseModel({required this.data, required this.pagination});

  factory GetSiteStatusResponseModel.fromJson(Map<String, dynamic> json) => _$GetSiteStatusResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetSiteStatusResponseModelToJson(this);

  GetSiteStatusResponseModel copyWith({
    List<SiteData>? data,
    Pagination? pagination,
  }) {
    return GetSiteStatusResponseModel(
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }

  static GetSiteStatusResponseModel get defaultInstance => GetSiteStatusResponseModel(
    data: [],
    pagination: Pagination.defaultInstance,
  );

   List<SiteEntity> toEntities() {
    final List<SiteEntity> sites = [];
    for (SiteData site in data) {
      sites.add(SiteEntity(
        siteId: site.siteId,
        siteVersionId: site.siteVersionId,
        siteName: site.siteName,
        resolvedAddress: site.address,
        description: site.description,
        lat: site.lat,
        lng: site.lng,
        status: site.state,
        createdAt: DateTime.parse(site.createdAt),
        medias: [MediaEntity.defaultInstance.copyWith(url: site.pictureUrl)],
        typeOfModification: site.typeOfModification,
      ));
    }
    return sites;
  }

}

@JsonSerializable()
class SiteData {
  final int siteId;
  final int siteVersionId;
  final String siteName;
  final String address;
  final String? description;
  final double lat;
  final double lng;
  final String state;
  final String createdAt;
  final String actionAppliedAt;
  final String? pictureUrl;
  final String typeOfModification;

  SiteData({
    required this.siteId,
    required this.siteVersionId,
    required this.siteName,
    required this.address,
    this.description,
    required this.lat,
    required this.lng,
    required this.state,
    required this.createdAt,
    required this.actionAppliedAt,
    this.pictureUrl,
    required this.typeOfModification,
  });

  factory SiteData.fromJson(Map<String, dynamic> json) => _$SiteDataFromJson(json);
  Map<String, dynamic> toJson() => _$SiteDataToJson(this);

  SiteData copyWith({
    int? siteId,
    int? siteVersionId,
    String? siteName,
    String? address,
    String? description,
    double? lat,
    double? lng,
    String? state,
    String? createdAt,
    String? actionAppliedAt,
    String? pictureUrl,
    String? typeOfModification,
  }) {
    return SiteData(
      siteId: siteId ?? this.siteId,
      siteVersionId: siteVersionId ?? this.siteVersionId,
      siteName: siteName ?? this.siteName,
      address: address ?? this.address,
      description: description ?? this.description,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      state: state ?? this.state,
      createdAt: createdAt ?? this.createdAt,
      actionAppliedAt: actionAppliedAt ?? this.actionAppliedAt,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      typeOfModification: typeOfModification ?? this.typeOfModification,
    );
  }

  static SiteData get defaultInstance => SiteData(
    siteId: 0,
    siteVersionId: 0,
    siteName: '',
    address: '',
    lat: 0,
    lng: 0,
    state: '',
    createdAt: '',
    actionAppliedAt: '',
    typeOfModification: '',
  );
}
