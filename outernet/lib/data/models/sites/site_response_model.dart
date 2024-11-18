import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/env/log_service.dart';

part 'site_response_model.g.dart';

final logger = LogService().logger;

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
  }) {
    logger.i('SiteResponseModel: using for get a detailed site information, responses when get publicity or get owner site');
    logger.i(toJson());
  }

  factory SiteResponseModel.fromJson(Map<String, dynamic> json) => _$SiteResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SiteResponseModelToJson(this);

  @override
  String toString() {
    return 'SiteResponseModel(siteId: $siteId, siteVersionId: $siteVersionId, ownerId: $ownerId, ownerUsername: $ownerUsername, siteName: $siteName, lat: $lat, lng: $lng, resolvedAddress: $resolvedAddress, website: $website, createdAt: $createdAt, siteType: $siteType, phoneNumbers: $phoneNumbers, groupedServices: $groupedServices, openingTimes: $openingTimes)';
  }

  SiteResponseModel copyWith({
    int? siteId,
    int? siteVersionId,
    int? ownerId,
    String? ownerUsername,
    String? siteName,
    double? lat,
    double? lng,
    String? resolvedAddress,
    String? website,
    String? createdAt,
    SiteType? siteType,
    List<String>? phoneNumbers,
    List<GroupedService>? groupedServices,
    List<OpeningTime>? openingTimes,
  }) {
    return SiteResponseModel(
      siteId: siteId ?? this.siteId,
      siteVersionId: siteVersionId ?? this.siteVersionId,
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
    );
  }

  static final SiteResponseModel defaultInstance = SiteResponseModel(
    siteId: 0,
    siteVersionId: 0,
    ownerId: 0,
    ownerUsername: '',
    siteName: '',
    lat: 0.0,
    lng: 0.0,
    resolvedAddress: '',
    website: '',
    createdAt: '',
    siteType: SiteType.defaultInstance,
    phoneNumbers: [],
    groupedServices: [],
    openingTimes: [],
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

  @override
  String toString() {
    return 'OpeningTime(dayOfWeek: $dayOfWeek, openTime: $openTime, closeTime: $closeTime)';
  }

  OpeningTime copyWith({
    String? dayOfWeek,
    String? openTime,
    String? closeTime,
  }) {
    return OpeningTime(
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
    );
  }

  static final OpeningTime defaultInstance = OpeningTime(
    dayOfWeek: '',
    openTime: '',
    closeTime: '',
  );
}