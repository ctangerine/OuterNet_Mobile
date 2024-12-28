import 'package:json_annotation/json_annotation.dart';

part 'media_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class MediaEntity {
  final int? id;
  final String? idStr;
  final String? url;
  final String? mediaType;
  final DateTime? createdAt;

  MediaEntity({
    this.id,
    this.idStr,
    this.url,
    this.mediaType,
    this.createdAt,
  });

  factory MediaEntity.fromJson(Map<String, dynamic> json) => _$MediaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MediaEntityToJson(this);

  MediaEntity copyWith({
    int? id,
    String? idStr,
    String? url,
    String? mediaType,
    DateTime? createdAt,
  }) {
    return MediaEntity(
      id: id ?? this.id,
      idStr: idStr ?? this.idStr,
      url: url ?? this.url,
      mediaType: mediaType ?? this.mediaType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static MediaEntity defaultInstance = MediaEntity(
    id: 0,
    idStr: 'Unknown',
    url: 'Unknown',
    mediaType: 'Unknown',
    createdAt: DateTime(1970, 1, 1),
  );
}