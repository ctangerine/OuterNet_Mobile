import 'package:outernet/data/data_sources/dio_network/dio_network.dart';
import 'package:outernet/data/data_sources/remote_datasources/plan_api_implement.dart';
import 'package:outernet/data/repository_implement/plan_repo_impl.dart';
import 'package:outernet/domain/repositories/plan_repository.dart';
import 'package:outernet/domain/usecases/plan_usecase.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_bloc.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';

initPlanInjection() {
  sl.isRegistered<PlanApiImplement>() ? sl.get<PlanApiImplement>() : sl.registerSingleton(PlanApiImplement(DioNetwork.appAPI));
  sl.registerSingleton<PlanRepository>(PlanRepositoryImplement(sl()));
  sl.registerSingleton<PlanUsecase>(PlanUsecase(sl()));

  sl.registerFactory<PlanBloc>(() => PlanBloc(sl()));
}