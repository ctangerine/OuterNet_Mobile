// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_site_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSiteResponseModel _$SearchSiteResponseModelFromJson(
        Map<String, dynamic> json) =>
    SearchSiteResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SiteResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchSiteResponseModelToJson(
        SearchSiteResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination?.toJson(),
    };
