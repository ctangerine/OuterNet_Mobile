// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaEntity _$MediaEntityFromJson(Map<String, dynamic> json) => MediaEntity(
      id: (json['id'] as num?)?.toInt(),
      idStr: json['idStr'] as String?,
      url: json['url'] as String?,
      mediaType: json['mediaType'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MediaEntityToJson(MediaEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idStr': instance.idStr,
      'url': instance.url,
      'mediaType': instance.mediaType,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
