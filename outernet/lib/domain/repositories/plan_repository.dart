import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/plan/plan_request_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/plan_entity.dart';

abstract class PlanRepository {
  Future<Either<Failure, String>> addPlan(CreateOrUpdatePlanRequestModel request);
  Future<Either<Failure, String>> updatePlan(CreateOrUpdatePlanRequestModel request, int planId);
  Future<Either<Failure, String>> deletePlan(int planId);
  Future<Either<Failure, PlanEntity>> getPlan(int planId);
  Future<Either<Failure, String>> removeMemberFromPlan(AddOrRemovePlanMemberRequestModel request, int planId);
  Future<Either<Failure, String>> addMemberToPlan(AddOrRemovePlanMemberRequestModel request, int planId);
  Future<Either<Failure, String>> changeMemberRole(ChangeMemberRoleRequestModel request, int planId);
  Future<Either<Failure, String>> addSiteToPlan(PlanSiteManagementRequestModel request, int planId);
  Future<Either<Failure, String>> updateSiteInPlan(PlanSiteManagementRequestModel request, int planId);
  Future<Either<Failure, String>> removeSiteFromPlan(PlanSiteManagementRequestModel request, int planId);
  Future<Either<Failure, List<PlanEntity>>> getAllPlan();
}