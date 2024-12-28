import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/data/models/user/user_response_model.dart';
import 'package:outernet/domain/entities/site_entity.dart';

part 'search_site_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchSiteResponseModel {
  final List<SiteResponseModel>? sites;
  final Pagination? pagination;

  SearchSiteResponseModel({this.sites, this.pagination});

  factory SearchSiteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchSiteResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSiteResponseModelToJson(this);

  static final SearchSiteResponseModel defaultInstance = SearchSiteResponseModel(
    sites: [],
    pagination: Pagination.defaultInstance,
  );

  SearchSiteResponseModel copyWith({
    List<SiteResponseModel>? sites,
    Pagination? pagination,
  }) {
    return SearchSiteResponseModel(
      sites: sites ?? this.sites,
      pagination: pagination ?? this.pagination,
    );
  }

  List<SiteEntity> toEntities() {
    final sites = this.sites?.map((e) => e.toEntity()).toList() ?? [];

    return sites;
  }
}