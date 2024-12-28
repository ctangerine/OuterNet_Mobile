import 'package:outernet/domain/entities/plan_entity.dart';

abstract class PlanState {}

class InitialPlanState extends PlanState {
  final List<PlanEntity>? plans;

  InitialPlanState({this.plans});
}

class LoadPlanListSuccess extends PlanState {
  final List<PlanEntity> plans;
  final PlanEntity specificPlan;

  bool? isRecentlyAddPlan;
  bool? isRecentlyUpdatePlan;
  bool? isRecentlyDeletePlan;
  bool? isRecentlyGetPlanDetail;
  bool? isRecentlyAddMember;
  bool? isRecentlyRemoveMember;
  bool? isRecentlyChangeMemberRole;
  bool? isRecentlyAddSite;
  bool? isRecentlyUpdateSite;
  bool? isRecentlyRemoveSite;
  bool? isRecentlyGetAllPlan;

  String? message;
  String? error;

  LoadPlanListSuccess._({
    required this.plans,
    required this.specificPlan,
    this.isRecentlyAddPlan = false,
    this.isRecentlyUpdatePlan = false,
    this.isRecentlyDeletePlan = false,
    this.isRecentlyGetPlanDetail = false,
    this.isRecentlyAddMember = false,
    this.isRecentlyRemoveMember = false,
    this.isRecentlyChangeMemberRole = false,
    this.isRecentlyAddSite = false,
    this.isRecentlyUpdateSite = false,
    this.isRecentlyRemoveSite = false,
    this.isRecentlyGetAllPlan = false,
    this.message,
    this.error,
  });

  factory LoadPlanListSuccess({
    required List<PlanEntity> plans,
    PlanEntity? specificPlan,
    bool? isRecentlyAddPlan,
    bool? isRecentlyUpdatePlan,
    bool? isRecentlyDeletePlan,
    bool? isRecentlyGetPlanDetail,
    bool? isRecentlyAddMember,
    bool? isRecentlyRemoveMember,
    bool? isRecentlyChangeMemberRole,
    bool? isRecentlyAddSite,
    bool? isRecentlyUpdateSite,
    bool? isRecentlyRemoveSite,
    bool? isRecentlyGetAllPlan,
    String? message,
    String? error,
  }) {
    return LoadPlanListSuccess._(
      plans: plans,
      specificPlan: specificPlan ?? PlanEntity.defaultInstance,
      isRecentlyAddPlan: isRecentlyAddPlan ?? false,
      isRecentlyUpdatePlan: isRecentlyUpdatePlan ?? false,
      isRecentlyDeletePlan: isRecentlyDeletePlan ?? false,
      isRecentlyGetPlanDetail: isRecentlyGetPlanDetail ?? false,
      isRecentlyAddMember: isRecentlyAddMember ?? false,
      isRecentlyRemoveMember: isRecentlyRemoveMember ?? false,
      isRecentlyChangeMemberRole: isRecentlyChangeMemberRole ?? false,
      isRecentlyAddSite: isRecentlyAddSite ?? false,
      isRecentlyUpdateSite: isRecentlyUpdateSite ?? false,
      isRecentlyRemoveSite: isRecentlyRemoveSite ?? false,
      isRecentlyGetAllPlan: isRecentlyGetAllPlan ?? false,
      message: message,
      error: error,
    );
  }

  static LoadPlanListSuccess defaultInstance = LoadPlanListSuccess._(
    plans: [],
    specificPlan: PlanEntity.defaultInstance,
  );

  LoadPlanListSuccess copyWith({
    List<PlanEntity>? plans,
    PlanEntity? specificPlan,
    bool? isRecentlyAddPlan,
    bool? isRecentlyUpdatePlan,
    bool? isRecentlyDeletePlan,
    bool? isRecentlyGetPlanDetail,
    bool? isRecentlyAddMember,
    bool? isRecentlyRemoveMember,
    bool? isRecentlyChangeMemberRole,
    bool? isRecentlyAddSite,
    bool? isRecentlyUpdateSite,
    bool? isRecentlyRemoveSite,
    bool? isRecentlyGetAllPlan,
    String? message,
    String? error,
  }) {
    return LoadPlanListSuccess(
      plans: plans ?? this.plans,
      specificPlan: specificPlan ?? this.specificPlan,
      isRecentlyAddPlan: isRecentlyAddPlan ?? this.isRecentlyAddPlan,
      isRecentlyUpdatePlan: isRecentlyUpdatePlan ?? this.isRecentlyUpdatePlan,
      isRecentlyDeletePlan: isRecentlyDeletePlan ?? this.isRecentlyDeletePlan,
      isRecentlyGetPlanDetail: isRecentlyGetPlanDetail ?? this.isRecentlyGetPlanDetail,
      isRecentlyAddMember: isRecentlyAddMember ?? this.isRecentlyAddMember,
      isRecentlyRemoveMember: isRecentlyRemoveMember ?? this.isRecentlyRemoveMember,
      isRecentlyChangeMemberRole: isRecentlyChangeMemberRole ?? this.isRecentlyChangeMemberRole,
      isRecentlyAddSite: isRecentlyAddSite ?? this.isRecentlyAddSite,
      isRecentlyUpdateSite: isRecentlyUpdateSite ?? this.isRecentlyUpdateSite,
      isRecentlyRemoveSite: isRecentlyRemoveSite ?? this.isRecentlyRemoveSite,
      isRecentlyGetAllPlan: isRecentlyGetAllPlan ?? this.isRecentlyGetAllPlan,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }
}

class LoadPlanListFailed extends PlanState {
  final String message;

  LoadPlanListFailed(this.message);
}