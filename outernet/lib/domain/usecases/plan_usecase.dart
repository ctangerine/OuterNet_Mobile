import 'package:dartz/dartz.dart';
import 'package:outernet/data/models/plan/plan_request_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/plan_entity.dart';
import 'package:outernet/domain/repositories/plan_repository.dart';

class PlanUsecase {
  final PlanRepository planRepository;

  PlanUsecase(this.planRepository);

  Future<Either<Failure, String>> addPlan(CreateOrUpdatePlanRequestModel request) {
    return planRepository.addPlan(request);
  }

  Future<Either<Failure, String>> updatePlan(CreateOrUpdatePlanRequestModel request, int planId) {
    return planRepository.updatePlan(request, planId);
  }

  Future<Either<Failure, String>> deletePlan(int planId) {
    return planRepository.deletePlan(planId);
  }

  Future<Either<Failure, PlanEntity>> getPlan(int planId) {
    return planRepository.getPlan(planId);
  }

  Future<Either<Failure, String>> removeMemberFromPlan(AddOrRemovePlanMemberRequestModel request, int planId) {
    return planRepository.removeMemberFromPlan(request, planId);
  }

  Future<Either<Failure, String>> addMemberToPlan(AddOrRemovePlanMemberRequestModel request, int planId) {
    return planRepository.addMemberToPlan(request, planId);
  }

  Future<Either<Failure, String>> changeMemberRole(ChangeMemberRoleRequestModel request, int planId) {
    return planRepository.changeMemberRole(request, planId);
  }

  Future<Either<Failure, String>> addSiteToPlan(PlanSiteManagementRequestModel request, int planId) {
    return planRepository.addSiteToPlan(request, planId);
  }

  Future<Either<Failure, String>> updateSiteInPlan(PlanSiteManagementRequestModel request, int planId) {
    return planRepository.updateSiteInPlan(request, planId);
  }

  Future<Either<Failure, String>> removeSiteFromPlan(PlanSiteManagementRequestModel request, int planId) {
    return planRepository.removeSiteFromPlan(request, planId);
  }

  Future<Either<Failure, List<PlanEntity>>> getAllPlan() {
    return planRepository.getAllPlan();
  }
}