import 'package:json_annotation/json_annotation.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/domain/entities/plan_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/domain/entities/user_entity.dart';

part 'plan_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Member {
  final int? userId;
  final String? nickname;
  final String? avatarUrl;
  final String? role;

  Member({
    this.userId,
    this.nickname,
    this.avatarUrl,
    this.role,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
  Map<String, dynamic> toJson() => _$MemberToJson(this);

  UserEntity toEntity() {
    final user = UserEntity.defaultInstance.copyWith(
      id: userId,
      nickname: nickname,
      avatar: avatarUrl,
      role: role
    );

    return user;
  }
}

@JsonSerializable(explicitToJson: true)
class GetPlanResponseModel {
  final int? id;
  final String? name;
  final String? description;
  final DateTime? startTime;
  final DateTime? endTime;
  final String? coverUrl;
  final List<SiteInPlan> sites;
  final List<Member> members;

  GetPlanResponseModel({
    this.id,
    this.name,
    this.description,
    this.startTime,
    this.endTime,
    this.coverUrl,
    this.sites = const [],
    this.members = const [],
  });

  factory GetPlanResponseModel.fromJson(Map<String, dynamic> json) => _$GetPlanResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetPlanResponseModelToJson(this);

  GetPlanResponseModel copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    String? coverUrl,
    List<SiteInPlan>? sites,
    List<Member>? members,
  }) {
    return GetPlanResponseModel(
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

  static GetPlanResponseModel defaultInstance = GetPlanResponseModel(
    id: 0,
    name: '',
    description: '',
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    coverUrl: '',
    sites: [],
    members: [],
  );

  PlanEntity toEntity() {
    final plan = PlanEntity.defaultInstance.copyWith(
      id: id,
      name: name,
      description: description,
      startTime: startTime,
      endTime: endTime,
      coverUrl: coverUrl,
      sites: sites.map((site) => site.toEntity()).toList(),
      members: members.map((member) => member.toEntity()).toList(),
    );

    return plan;
  }
}

@JsonSerializable(explicitToJson: true)
class GetAllPlanRequestModel {
  final List<GetPlanResponseModel>? plans;

  GetAllPlanRequestModel({
    this.plans,
  });

  factory GetAllPlanRequestModel.fromJson(Map<String, dynamic> json) => _$GetAllPlanRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllPlanRequestModelToJson(this);

  GetAllPlanRequestModel copyWith({
    List<GetPlanResponseModel>? plans,
  }) {
    return GetAllPlanRequestModel(
      plans: plans ?? this.plans,
    );
  }

  static GetAllPlanRequestModel defaultInstance = GetAllPlanRequestModel(
    plans: [],
  );

  List<PlanEntity> toEntity() {
    final plans = this.plans?.map((plan) => plan.toEntity()).toList() ?? [];

    return plans;
  }
}

@JsonSerializable(explicitToJson: true)
class SiteInPlan {
  final String? name;
  final String? description;
  final DateTime? startTime;
  final DateTime? endTime;
  final SiteResponseModel? siteBasicInfoRspnDto;

  SiteInPlan({
    this.name,
    this.description,
    this.startTime,
    this.endTime,
    this.siteBasicInfoRspnDto,
  });

  factory SiteInPlan.fromJson(Map<String, dynamic> json) => _$SiteInPlanFromJson(json);
  Map<String, dynamic> toJson() => _$SiteInPlanToJson(this);

  SiteInPlan copyWith({
    String? name,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    SiteResponseModel? siteBasicInfoRspnDto,
  }) {
    return SiteInPlan(
      name: name ?? this.name,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      siteBasicInfoRspnDto: siteBasicInfoRspnDto ?? this.siteBasicInfoRspnDto,
    );
  }

  static SiteInPlan defaultInstance = SiteInPlan(
    name: '',
    description: '',
    startTime: DateTime.now(),
    endTime: DateTime.now(),
    siteBasicInfoRspnDto: SiteResponseModel.defaultInstance,
  );

  SiteEntity toEntity() {
    final SiteEntity preEntity = siteBasicInfoRspnDto?.toEntity() ?? SiteEntity.defaultInstance;
    final trueEntity = preEntity.copyWith(
      name: name,
      description: description,
      startTime: startTime,
      endTime: endTime,
    );

    return trueEntity;
  }
}