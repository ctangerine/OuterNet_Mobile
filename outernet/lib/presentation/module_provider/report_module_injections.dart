import 'package:outernet/data/data_sources/dio_network/dio_network.dart';
import 'package:outernet/data/data_sources/remote_datasources/report_api_implement.dart';
import 'package:outernet/data/repository_implement/report_repo_impl.dart';
import 'package:outernet/domain/repositories/report_repository.dart';
import 'package:outernet/domain/usecases/report_usecase.dart';
import 'package:outernet/presentation/blocs/report_bloc/report_bloc.dart';

import 'init_injections.dart';

initReportInjection() {
  sl.isRegistered<ReportApiImplement>() ? sl.get<ReportApiImplement>() : sl.registerSingleton(ReportApiImplement(DioNetwork.appAPI));
  sl.registerSingleton<ReportRepository>(ReportRepositoryImplement(sl()));
  sl.registerSingleton<ReportUsecase>(ReportUsecase(sl()));

  sl.registerFactory<ReportBloc>(() => ReportBloc(sl()));
}