import 'package:json_annotation/json_annotation.dart';

part 'site_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SiteResponseModel {
  final int? siteId;
  final int? siteVersionId;
  final int? ownerId;
  final String? ownerUsername;
  final String? siteName;
  final double? lat;
  final double? lng;
  final String? resolvedAddress;
  final String? website;
  final String? createdAt;
  final SiteType? siteType;
  final List<String>? phoneNumbers;
  final List<GroupedService>? groupedServices;
  final List<OpeningTime>? openingTimes;

  SiteResponseModel({
    this.siteId,
    this.siteVersionId,
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
  });

  factory SiteResponseModel.fromJson(Map<String, dynamic> json) => _$SiteResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SiteResponseModelToJson(this);
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

@JsonSerializable(explicitToJson: true)
class GroupedService {
  final ServiceGroup? serviceGroup;
  final List<Service>? services;

  GroupedService({
    this.serviceGroup,
    this.services,
  });

  factory GroupedService.fromJson(Map<String, dynamic> json) => _$GroupedServiceFromJson(json);
  Map<String, dynamic> toJson() => _$GroupedServiceToJson(this);
}

@JsonSerializable()
class ServiceGroup {
  final int? id;
  final String? serviceGroupName;

  ServiceGroup({
    this.id,
    this.serviceGroupName,
  });

  factory ServiceGroup.fromJson(Map<String, dynamic> json) => _$ServiceGroupFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceGroupToJson(this);
}

@JsonSerializable()
class Service {
  final int? id;
  final String? serviceName;

  Service({
    this.id,
    this.serviceName,
  });

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}

@JsonSerializable()
class OpeningTime {
  final String? dayOfWeek;
  final String? openTime;
  final String? closeTime;

  OpeningTime({
    this.dayOfWeek,
    this.openTime,
    this.closeTime,
  });

  factory OpeningTime.fromJson(Map<String, dynamic> json) => _$OpeningTimeFromJson(json);
  Map<String, dynamic> toJson() => _$OpeningTimeToJson(this);
}