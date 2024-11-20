import 'package:outernet/data/data_sources/dio_network/dio_network.dart';
import 'package:outernet/data/data_sources/remote_datasources/site_api_implement.dart';
import 'package:outernet/data/repository_implement/site_repo_impl.dart';
import 'package:outernet/domain/repositories/site_repository.dart';
import 'package:outernet/domain/usecases/site_usecase.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';

initSiteInjection() {
  sl.isRegistered<SiteApiImplement>() ? sl.get<SiteApiImplement>() : sl.registerSingleton(SiteApiImplement(DioNetwork.appAPI));
  sl.registerSingleton<SiteRepository>(SiteRepositoryImplement(sl()));
  sl.registerSingleton<SiteUsecase>(SiteUsecase(sl()));

  sl.registerFactory<SiteBloc>(() => SiteBloc(sl()));
}