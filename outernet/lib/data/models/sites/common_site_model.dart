import 'package:json_annotation/json_annotation.dart';

part 'common_site_model.g.dart';

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



@JsonSerializable(explicitToJson: true)
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
    return 'ServiceGroup(id: $id, serviceName: $serviceGroupName)';
  }

  ServiceGroup copyWith({
    int? id,
    String? serviceName,
  }) {
    return ServiceGroup(
      id: id ?? this.id,
      serviceGroupName: serviceName ?? serviceGroupName,
    );
  }

  static final ServiceGroup defaultInstance = ServiceGroup(
    id: 0,
    serviceGroupName: '',
  );
}


@JsonSerializable(explicitToJson: true)
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