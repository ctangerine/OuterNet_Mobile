import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/presentation/screens/asset_links.dart';

part 'plan_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class PlanEntity {
  final int? id;
  final String? name;
  final String? description;
  final DateTime? startTime;
  final DateTime? endTime;
  final String? coverUrl;
  final List<SiteEntity>? sites;
  final List<UserEntity>? members;

  PlanEntity({
    this.id,
    this.name,
    this.description,
    this.startTime,
    this.endTime,
    this.coverUrl,
    this.sites,
    this.members,
  });

  factory PlanEntity.fromJson(Map<String, dynamic> json) => _$PlanEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PlanEntityToJson(this);

  PlanEntity copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    String? coverUrl,
    List<SiteEntity>? sites,
    List<UserEntity>? members,
  }) {
    return PlanEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      coverUrl: coverUrl ?? this.coverUrl,
      sites: sites ?? this.sites,
      members: members ?? this.members,
    );
  }

  static PlanEntity defaultInstance = PlanEntity(
    id: 0,
    name: '',
    description: '',
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    coverUrl: cardSpringConcept,
    sites: [],
    members: [],
  );
}