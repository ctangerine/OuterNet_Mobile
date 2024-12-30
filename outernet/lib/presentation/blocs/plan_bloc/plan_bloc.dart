import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database_provider.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/domain/entities/plan_entity.dart';
import 'package:outernet/domain/usecases/plan_usecase.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_events.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_state.dart';

class PlanBloc extends Bloc<PlanEvents, PlanState> {
  final PlanUsecase planUsecase;
  final AppDatabase _db = dbProvider.database;

  PlanBloc(this.planUsecase) : super(InitialPlanState()) {
    on<AddNewPlan>(_onAddNewPlan);
    on<UpdatePlan>(_onUpdatePlan);
    on<DeletePlan>(_onDeletePlan);
    on<GetPlanDetail>(_onGetPlanDetail);
    on<RemoveMemberFromPlan>(_onRemoveMemberFromPlan);
    on<AddMemberToPlan>(_onAddMemberToPlan);
    on<ChangeMemberRole>(_onChangeMemberRole);
    on<AddSiteToPlan>(_onAddSiteToPlan);
    on<UpdateSiteInPlan>(_onUpdateSiteInPlan);
    on<RemoveSiteFromPlan>(_onRemoveSiteFromPlan);
    on<GetAllPlan>(_onGetAllPlan);
  }

  Future<void> _onAddNewPlan(AddNewPlan event, Emitter<PlanState> emit) async {
    final result = await planUsecase.addPlan(event.request);
    final completer = Completer<void>();

    result.fold(
      (failure) {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(error: failure.message));
        } else {
          emit(LoadPlanListFailed(failure.message));
        }
      },
      (message) async {
        if (!completer.isCompleted) {
          await completer.future;
        }
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(message: message, isRecentlyAddPlan: true));
        } else {
          emit(LoadPlanListSuccess.defaultInstance.copyWith(
            plans: [],
            message: message,
            isRecentlyAddPlan: true,
          ));
        }

        await _updatePlansAndEmit(emit);
        completer.complete();
      },
    );
  }

  Future<void> _onUpdatePlan(UpdatePlan event, Emitter<PlanState> emit) async {
    final result = await planUsecase.updatePlan(event.request, event.planId);

    result.fold(
      (failure) {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(error: failure.message));
        } else {
          emit(LoadPlanListFailed(failure.message));
        }
      },
      (message) async {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(message: message, isRecentlyUpdatePlan: true));
        } else {
          emit(LoadPlanListSuccess.defaultInstance.copyWith(
            plans: [],
            message: message,
            isRecentlyUpdatePlan: true,
          ));
        }

        await _updatePlansAndEmit(emit);
      },
    );
  }

  Future<void> _onDeletePlan(DeletePlan event, Emitter<PlanState> emit) async {
    final result = await planUsecase.deletePlan(event.planId);

    result.fold(
      (failure) {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(error: failure.message));
        } else {
          emit(LoadPlanListFailed(failure.message));
        }
      },
      (message) {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(message: message, isRecentlyDeletePlan: true));
        } else {
          emit(LoadPlanListSuccess.defaultInstance.copyWith(
            plans: [],
            message: message,
            isRecentlyDeletePlan: true,
          ));
        }
      },
    );

    await _db.removePlan(event.planId);
    await _updatePlansAndEmit(emit);
    
  }

 Future<void> _onGetPlanDetail(GetPlanDetail event, Emitter<PlanState> emit) async {
  final localPlan = await _db.loadPlanById(event.planId);
  final result = await planUsecase.getPlan(event.planId);
  bool success = false;
  result.fold(
    (failure) {
      if (state is LoadPlanListSuccess) {
        emit((state as LoadPlanListSuccess).copyWith(error: failure.message));
      } else {
        emit(LoadPlanListFailed(failure.message));
      }
    },
    (plan) {
      if (state is LoadPlanListSuccess) {
        logger.f('Plan detail: ${plan.toJson()}');
        emit((state as LoadPlanListSuccess).copyWith(
          specificPlan: plan.copyWith(id: event.planId, coverUrl: localPlan?.coverUrl),
          isRecentlyGetPlanDetail: true,
        ));
      } else {
        emit(LoadPlanListSuccess.defaultInstance.copyWith(
          plans: [],
          specificPlan: plan,
          isRecentlyGetPlanDetail: true,
        ));
      }

      success = true;
    },
  );

  if (success) {
    try {
      await _db.upsertPlan(
        event.planId,
        localPlan!.copyWith(
          id: event.planId,
          members: (state as LoadPlanListSuccess).specificPlan.members ?? PlanEntity.defaultInstance.members,
          sites: (state as LoadPlanListSuccess).specificPlan.sites ?? PlanEntity.defaultInstance.sites,
        ));
    } catch (e) {
      logger.e('Cannot save plan to local database, error: $e');
    }
  }
}

  Future<void> _onRemoveMemberFromPlan(RemoveMemberFromPlan event, Emitter<PlanState> emit) async {
    final result = await planUsecase.removeMemberFromPlan(event.request, event.planId);

    result.fold(
      (failure) {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(error: failure.message));
        } else {
          emit(LoadPlanListFailed(failure.message));
        }
      },
      (message) async {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(message: message, isRecentlyRemoveMember: true));
        } else {
          emit(LoadPlanListSuccess.defaultInstance.copyWith(
            plans: [],
            message: message,
            isRecentlyRemoveMember: true,
          ));
        }
      },
    );
  }

  Future<void> _onAddMemberToPlan(AddMemberToPlan event, Emitter<PlanState> emit) async {
    final result = await planUsecase.addMemberToPlan(event.request, event.planId);

    result.fold(
      (failure) {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(error: failure.message));
        } else {
          emit(LoadPlanListFailed(failure.message));
        }
      },
      (message) async {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(message: message, isRecentlyAddMember: true));
        } else {
          emit(LoadPlanListSuccess.defaultInstance.copyWith(
            plans: [],
            message: message,
            isRecentlyAddMember: true,
          ));
        }
      },
    );
  }

  Future<void> _onChangeMemberRole(ChangeMemberRole event, Emitter<PlanState> emit) async {
    final result = await planUsecase.changeMemberRole(event.request, event.planId);

    result.fold(
      (failure) {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(error: failure.message));
        } else {
          emit(LoadPlanListFailed(failure.message));
        }
      },
      (message) {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(message: message, isRecentlyChangeMemberRole: true));
        } else {
          emit(LoadPlanListSuccess.defaultInstance.copyWith(
            plans: [],
            message: message,
            isRecentlyChangeMemberRole: true,
          ));
        }
      },
    );
  }

  Future<void> _onAddSiteToPlan(AddSiteToPlan event, Emitter<PlanState> emit) async {
    final result = await planUsecase.addSiteToPlan(event.request, event.planId);

    result.fold(
      (failure) {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(error: failure.message));
        } else {
          emit(LoadPlanListFailed(failure.message));
        }
      },
      (message)  {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(message: message, isRecentlyAddSite: true));
        } else {
          emit(LoadPlanListSuccess.defaultInstance.copyWith(
            plans: [],
            message: message,
            isRecentlyAddSite: true,
          ));
        }
      },
    );
    await _updatePlansAndEmit(emit);
  }

  Future<void> _onUpdateSiteInPlan(UpdateSiteInPlan event, Emitter<PlanState> emit) async {
    final result = await planUsecase.updateSiteInPlan(event.request, event.planId);

    result.fold(
      (failure) {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(error: failure.message));
        } else {
          emit(LoadPlanListFailed(failure.message));
        }
      },
      (message)  async {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(message: message, isRecentlyUpdateSite: true));
        } else {
          emit(LoadPlanListSuccess.defaultInstance.copyWith(
            plans: [],
            message: message,
            isRecentlyUpdateSite: true,
          ));
        }

        await _updatePlansAndEmit(emit);
      },
    );
  }

  Future<void> _onRemoveSiteFromPlan(RemoveSiteFromPlan event, Emitter<PlanState> emit) async {
    final result = await planUsecase.removeSiteFromPlan(event.request, event.planId);

    result.fold(
      (failure) {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(error: failure.message));
        } else {
          emit(LoadPlanListFailed(failure.message));
        }
      },
      (message) async {
        if (state is LoadPlanListSuccess) {
          emit((state as LoadPlanListSuccess).copyWith(message: message, isRecentlyRemoveSite: true));
        } else {
          emit(LoadPlanListSuccess.defaultInstance.copyWith(
            plans: [],
            message: message,
            isRecentlyRemoveSite: true,
          ));
        }

        await _updatePlansAndEmit(emit);
      },
    );
  }

  Future<void> _onGetAllPlan(GetAllPlan event, Emitter<PlanState> emit) async {
    final localPlans = await getLocalPlans();
    final result = await planUsecase.getAllPlan();
    result.fold(
      (failure) {
        emit(LoadPlanListFailed(failure.message));
      },
      (plans)  {
        final List<PlanEntity> result = plans.map((plan) {
          final localPlan = localPlans.firstWhere((element) => element.id == plan.id, orElse: () => PlanEntity.defaultInstance,);
          return plan.copyWith(
            members: localPlan.members,
            sites: localPlan.sites,
            coverUrl: localPlan.coverUrl
          );
        }).toList();

        emit(LoadPlanListSuccess.defaultInstance.copyWith(
          plans: result,
          isRecentlyGetAllPlan: true,
        ));
      },
    );
  }

  Future<void> _updatePlansAndEmit(Emitter<PlanState> emit) async {
    final result = await getAllPlan();
    final localPlans = await getLocalPlans();
    try {
      for (PlanEntity plan in result) {
        plan = plan.copyWith(
          members: localPlans.firstWhere((element) => element.id == plan.id, orElse: () => PlanEntity.defaultInstance).members,
          sites: localPlans.firstWhere((element) => element.id == plan.id, orElse: () => PlanEntity.defaultInstance).sites,
          coverUrl: localPlans.firstWhere((element) => element.id == plan.id, orElse: () => PlanEntity.defaultInstance).coverUrl,
        );
        await _db.upsertPlan(plan.id, plan);
      }

      logger.i('Save plan to local database successfully');

      emit((state as LoadPlanListSuccess).copyWith(plans: result, isRecentlyGetAllPlan: true));
    } catch (e) {
      logger.e('Cannot save plan to local database, error: $e');
    }
  }

  Future<List<PlanEntity>> getAllPlan() async {
    final result = await planUsecase.getAllPlan();
    return result.fold(
      (failure) => [],
      (plans) => plans,
    );
  }

  Future<List<PlanEntity>> getLocalPlans() async {
    return await _db.getAllPlans();
  }
}