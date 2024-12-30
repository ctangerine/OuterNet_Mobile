import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/domain/entities/media_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';

part 'site_by_loc_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SiteByLocResponseModel {
  final int siteId;
  final SiteType siteType;
  final String name;
  final double lat;
  final double lng;
  final List<Media> medias;
  final double averageRating;
  final int totalRating;

  SiteByLocResponseModel({
    required this.siteId,
    required this.siteType,
    required this.name,
    required this.lat,
    required this.lng,
    required this.medias,
    required this.averageRating,
    required this.totalRating,
  });

  factory SiteByLocResponseModel.fromJson(Map<String, dynamic> json) => _$SiteByLocResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SiteByLocResponseModelToJson(this);

  @override
  String toString() {
    return 'Site(siteId: $siteId, siteType: $siteType, name: $name, lat: $lat, lng: $lng)';
  }

  SiteByLocResponseModel copyWith({
    int? siteId,
    SiteType? siteType,
    String? name,
    double? lat,
    double? lng,
    List<Media>? medias,
    double? averageRating,
    int? totalRating,
  }) {
    return SiteByLocResponseModel(
      siteId: siteId ?? this.siteId,
      siteType: siteType ?? this.siteType,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      medias: medias ?? this.medias,
      averageRating: averageRating ?? this.averageRating,
      totalRating: totalRating ?? this.totalRating,
    );
  }

  static final SiteByLocResponseModel defaultInstance = SiteByLocResponseModel(
    siteId: 0,
    siteType: SiteType.defaultInstance,
    name: '',
    lat: 0.0,
    lng: 0.0,
    medias: [],
    averageRating: 0.0,
    totalRating: 0,
  );

  SiteEntity toEntity() {
    return SiteEntity.defaultInstance.copyWith(
      siteId: siteId,
      siteType: siteType,
      siteName: name,
      lat: lat,
      lng: lng,
      medias: medias.map((e) => e.toEntity()).toList(),
      averageRating: averageRating,
      totalRating: totalRating,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Media {
  final int id;
  final String url;
  final String mediaType;
  final String createdAt;

  Media({
    required this.id,
    required this.url,
    required this.mediaType,
    required this.createdAt,
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
    return MediaEntity.defaultInstance.copyWith(
      id: id,
      url: url,
      mediaType: mediaType,
      createdAt: DateTime.tryParse((createdAt)) ?? DateTime.now(),
    );
  }
}