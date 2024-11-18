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

  @override
  String toString() {
    return 'SiteTypeGroupServicesResponseModel(siteType: $siteType, groupedSiteServices: $groupedSiteServices)';
  }

  SiteTypeGroupServicesResponseModel copyWith({
    SiteType? siteType,
    List<GroupedService>? groupedSiteServices,
  }) {
    return SiteTypeGroupServicesResponseModel(
      siteType: siteType ?? this.siteType,
      groupedSiteServices: groupedSiteServices ?? this.groupedSiteServices,
    );
  }

  static final SiteTypeGroupServicesResponseModel defaultInstance = SiteTypeGroupServicesResponseModel(
    siteType: SiteType.defaultInstance,
    groupedSiteServices: [],
  );
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

  @override
  String toString() {
    return 'SiteType(id: $id, name: $name, attraction: $attraction, amenity: $amenity)';
  }

  SiteType copyWith({
    int? id,
    String? name,
    bool? attraction,
    bool? amenity,
  }) {
    return SiteType(
      id: id ?? this.id,
      name: name ?? this.name,
      attraction: attraction ?? this.attraction,
      amenity: amenity ?? this.amenity,
    );
  }

  static final SiteType defaultInstance = SiteType(
    id: 0,
    name: '',
    attraction: false,
    amenity: false,
  );
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

  @override
  String toString() {
    return 'GroupedService(serviceGroup: $serviceGroup, services: $services)';
  }

  GroupedService copyWith({
    ServiceGroup? serviceGroup,
    List<Service>? services,
  }) {
    return GroupedService(
      serviceGroup: serviceGroup ?? this.serviceGroup,
      services: services ?? this.services,
    );
  }

  static final GroupedService defaultInstance = GroupedService(
    serviceGroup: ServiceGroup.defaultInstance,
    services: [],
  );
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

  @override
  String toString() {
    return 'ServiceGroup(id: $id, serviceGroupName: $serviceGroupName)';
  }

  ServiceGroup copyWith({
    int? id,
    String? serviceGroupName,
  }) {
    return ServiceGroup(
      id: id ?? this.id,
      serviceGroupName: serviceGroupName ?? this.serviceGroupName,
    );
  }

  static final ServiceGroup defaultInstance = ServiceGroup(
    id: 0,
    serviceGroupName: '',
  );
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

  @override
  String toString() {
    return 'Service(id: $id, serviceName: $serviceName)';
  }

  Service copyWith({
    int? id,
    String? serviceName,
  }) {
    return Service(
      id: id ?? this.id,
      serviceName: serviceName ?? this.serviceName,
    );
  }

  static final Service defaultInstance = Service(
    id: 0,
    serviceName: '',
  );
}