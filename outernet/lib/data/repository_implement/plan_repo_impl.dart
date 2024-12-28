import 'package:dartz/dartz.dart';
import 'package:outernet/data/data_sources/remote_datasources/plan_api_implement.dart';
import 'package:outernet/data/models/plan/plan_request_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/plan_entity.dart';
import 'package:outernet/domain/repositories/plan_repository.dart';

class PlanRepositoryImplement implements PlanRepository {
  final PlanApiImplement remoteDataSource;

  PlanRepositoryImplement(this.remoteDataSource);

  @override 
  Future<Either<Failure, String>> addPlan(CreateOrUpdatePlanRequestModel request) async {
    try {
      final result = await remoteDataSource.addPlan(request);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to add plan: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> updatePlan(CreateOrUpdatePlanRequestModel request, int planId) async {
    try {
      final result = await remoteDataSource.updatePlan(request, planId);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to update plan: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> deletePlan(int planId) async {
    try {
      final result = await remoteDataSource.deletePlan(planId);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to delete plan: $e'));
    }
  }

  @override
  Future<Either<Failure, PlanEntity>> getPlan(int planId) async {
    try {
      final result = await remoteDataSource.getPlan(planId);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to get plan: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> removeMemberFromPlan(AddOrRemovePlanMemberRequestModel request, int planId) async {
    try {
      final result = await remoteDataSource.removeMemberFromPlan(request, planId);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to remove member from plan: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> addMemberToPlan(AddOrRemovePlanMemberRequestModel request, int planId) async {
    try {
      final result = await remoteDataSource.addMemberToPlan(request, planId);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to add member to plan: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> changeMemberRole(ChangeMemberRoleRequestModel request, int planId) async {
    try {
      final result = await remoteDataSource.changeMemberRole(request, planId);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to change member role: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> addSiteToPlan(PlanSiteManagementRequestModel request, int planId) async {
    try {
      final result = await remoteDataSource.addSiteToPlan(request, planId);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to add site to plan: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> updateSiteInPlan(PlanSiteManagementRequestModel request, int planId) async {
    try {
      final result = await remoteDataSource.updateSiteInPlan(request, planId);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to update site in plan: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> removeSiteFromPlan(PlanSiteManagementRequestModel request, int planId) async {
    try {
      final result = await remoteDataSource.removeSiteFromPlan(request, planId);
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to remove site from plan: $e'));
    }
  }

  @override
  Future<Either<Failure, List<PlanEntity>>> getAllPlan() async {
    try {
      final result = await remoteDataSource.getAllPlan();
      return Right(result);
    } catch (e) {
      return Left(Failure('Failed to get plans: $e'));
    }
  }
}