import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/env/log_service.dart';

part 'sitetype_response_model.g.dart';

final logger = LogService().logger;

@JsonSerializable(explicitToJson: true)
class SiteTypeGroupServicesResponseModel {
  final SiteType? siteType;
  final List<GroupedService>? groupedSiteServices;

  SiteTypeGroupServicesResponseModel({
    this.siteType,
    this.groupedSiteServices,
  }) {
    logger.i('SiteTypeGroupServicesResponseModel: using for get site type and group services belongs to this site type');
    logger.i(toJson());
  }

  factory SiteTypeGroupServicesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SiteTypeGroupServicesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SiteTypeGroupServicesResponseModelToJson(this);
}

@JsonSerializable()
class SiteType {
  final int? id;
  final String? name;
  final bool? attraction;
  final bool? amenity;

  SiteType({
    this.id,
    this.name,
    this.attraction,
    this.amenity,
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