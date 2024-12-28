// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanEntity _$PlanEntityFromJson(Map<String, dynamic> json) => PlanEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      coverUrl: json['coverUrl'] as String?,
      sites: (json['sites'] as List<dynamic>?)
          ?.map((e) => SiteEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanEntityToJson(PlanEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'coverUrl': instance.coverUrl,
      'sites': instance.sites?.map((e) => e.toJson()).toList(),
      'members': instance.members?.map((e) => e.toJson()).toList(),
    };
