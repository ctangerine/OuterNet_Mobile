import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/data/models/sites/site_review_response_model.dart';
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

  List<GroupedService> getGroupedServiceList() {
    final List<GroupedService> groupedService = [];

    for (GroupedService group in groupedSiteServices!) {
      groupedService.add(GroupedService.defaultInstance.copyWith(
        serviceGroup: group.serviceGroup,
        services: group.services,
      ));
    }

    return groupedService;
  }
}

@JsonSerializable(explicitToJson: true)
class GetAllSiteTypeResponseModel {
  List<SiteType>? data;
  Pagination? pagination;

  GetAllSiteTypeResponseModel({
    this.data,
    this.pagination,
  });

  factory GetAllSiteTypeResponseModel.fromJson(Map<String, dynamic> json) => _$GetAllSiteTypeResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllSiteTypeResponseModelToJson(this);

  @override
  String toString() {
    return 'GetAllSiteTypeResponseModel(data: $data, pagination: $pagination)';
  }

  GetAllSiteTypeResponseModel copyWith({
    List<SiteType>? data,
    Pagination? pagination,
  }) {
    return GetAllSiteTypeResponseModel(
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }

  static final GetAllSiteTypeResponseModel defaultInstance = GetAllSiteTypeResponseModel(
    data: [],
    pagination: Pagination.defaultInstance,
  );

  List<SiteType> getSiteTypeList() {
    return data ?? [];
  }

}