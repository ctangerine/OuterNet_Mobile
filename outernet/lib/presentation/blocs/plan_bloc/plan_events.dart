import 'package:outernet/data/models/plan/plan_request_model.dart';

abstract class PlanEvents {}

class LoadPlanList extends PlanEvents {}

class AddNewPlan extends PlanEvents {
  final CreateOrUpdatePlanRequestModel request;

  AddNewPlan(this.request);
}

class UpdatePlan extends PlanEvents {
  final CreateOrUpdatePlanRequestModel request;
  final int planId;

  UpdatePlan(this.request, this.planId);
}

class DeletePlan extends PlanEvents {
  final int planId;

  DeletePlan(this.planId);
}

class GetPlanDetail extends PlanEvents {
  final int planId;

  GetPlanDetail(this.planId);
}

class RemoveMemberFromPlan extends PlanEvents {
  final AddOrRemovePlanMemberRequestModel request;
  final int planId;

  RemoveMemberFromPlan(this.request, this.planId);
}

class AddMemberToPlan extends PlanEvents {
  final AddOrRemovePlanMemberRequestModel request;
  final int planId;

  AddMemberToPlan(this.request, this.planId);
}

class ChangeMemberRole extends PlanEvents {
  final ChangeMemberRoleRequestModel request;
  final int planId;

  ChangeMemberRole(this.request, this.planId);
}

class AddSiteToPlan extends PlanEvents {
  final PlanSiteManagementRequestModel request;
  final int planId;

  AddSiteToPlan(this.request, this.planId);
}

class UpdateSiteInPlan extends PlanEvents {
  final PlanSiteManagementRequestModel request;
  final int planId;

  UpdateSiteInPlan(this.request, this.planId);
}

class RemoveSiteFromPlan extends PlanEvents {
  final PlanSiteManagementRequestModel request;
  final int planId;

  RemoveSiteFromPlan(this.request, this.planId);
}

class GetAllPlan extends PlanEvents {}