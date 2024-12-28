
import 'package:json_annotation/json_annotation.dart';

part 'plan_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Cover {
  final String? id;
  final String? url;

  Cover({
    this.id,
    this.url,
  });

  factory Cover.fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);
  Map<String, dynamic> toJson() => _$CoverToJson(this);

  Cover copyWith({
    String? id,
    String? url,
  }) {
    return Cover(
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }

  static Cover defaultInstance = Cover(
    id: '',
    url: '',
  );
}

@JsonSerializable(explicitToJson: true)
class CreateOrUpdatePlanRequestModel {
  final String? name;
  final DateTime? startTime;
  final DateTime? endTime;
  final String? description;
  final Cover? cover;

  CreateOrUpdatePlanRequestModel({
    this.name,
    this.startTime,
    this.endTime,
    this.description,
    this.cover,
  });

  factory CreateOrUpdatePlanRequestModel.fromJson(Map<String, dynamic> json) => _$CreateOrUpdatePlanRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateOrUpdatePlanRequestModelToJson(this);

  CreateOrUpdatePlanRequestModel copyWith({
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    String? description,
    Cover? cover,
  }) {
    return CreateOrUpdatePlanRequestModel(
      name: name ?? this.name,
      startTime: startDate ?? startTime,
      endTime: endDate ?? endTime,
      description: description ?? this.description,
      cover: cover ?? this.cover,
    );
  }

  static CreateOrUpdatePlanRequestModel defaultInstance = CreateOrUpdatePlanRequestModel(
    name: '',
    startTime: DateTime(1970, 1, 1),
    endTime: DateTime(1970, 1, 1),
    description: '',
    cover: Cover.defaultInstance,
  );
}

@JsonSerializable(explicitToJson: true)
class ChangeMemberRoleRequestModel {
  final int? userId;
  final String? role;

  ChangeMemberRoleRequestModel({
    this.userId,
    this.role,
  });

  factory ChangeMemberRoleRequestModel.fromJson(Map<String, dynamic> json) => _$ChangeMemberRoleRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeMemberRoleRequestModelToJson(this);

  ChangeMemberRoleRequestModel copyWith({
    int? userId,
    String? role,
  }) {
    return ChangeMemberRoleRequestModel(
      userId: userId ?? this.userId,
      role: role ?? this.role,
    );
  }

  static ChangeMemberRoleRequestModel defaultInstance = ChangeMemberRoleRequestModel(
    userId: 0,
    role: '',
  );
}

@JsonSerializable(explicitToJson: true)
class PlanSiteManagementRequestModel{
  final int? siteId;
  final String? name;
  final String? description;
  final DateTime? startTime;
  final DateTime? endTime;

  PlanSiteManagementRequestModel({
    this.siteId,
    this.name,
    this.description,
    this.startTime,
    this.endTime,
  });

  factory PlanSiteManagementRequestModel.fromJson(Map<String, dynamic> json) => _$PlanSiteManagementRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlanSiteManagementRequestModelToJson(this);

  PlanSiteManagementRequestModel copyWith({
    int? siteId,
    String? name,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return PlanSiteManagementRequestModel(
      siteId: siteId ?? this.siteId,
      name: name ?? this.name,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  static PlanSiteManagementRequestModel defaultInstance = PlanSiteManagementRequestModel(
    siteId: 0,
    name: '',
    description: '',
    startTime: DateTime(1970, 1, 1),
    endTime: DateTime(1970, 1, 1),
  );
}


@JsonSerializable(explicitToJson: true)
class DeletePlanRequestModel {
  final int? planId;

  DeletePlanRequestModel({
    this.planId,
  });

  factory DeletePlanRequestModel.fromJson(Map<String, dynamic> json) => _$DeletePlanRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeletePlanRequestModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddOrRemovePlanMemberRequestModel {
  final int? planId;
  final int? userId;

  AddOrRemovePlanMemberRequestModel({
    this.planId,
    this.userId,
  });

  factory AddOrRemovePlanMemberRequestModel.fromJson(Map<String, dynamic> json) => _$AddOrRemovePlanMemberRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddOrRemovePlanMemberRequestModelToJson(this);
}  

@JsonSerializable(explicitToJson: true)
class RemoveSiteFromPlanRequestModel {
  final int? planId;
  final int? siteId;

  RemoveSiteFromPlanRequestModel({
    this.planId,
    this.siteId,
  });

  factory RemoveSiteFromPlanRequestModel.fromJson(Map<String, dynamic> json) => _$RemoveSiteFromPlanRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RemoveSiteFromPlanRequestModelToJson(this);
}
