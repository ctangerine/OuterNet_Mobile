import 'package:outernet/data/data_sources/database_datasources.dart';
import 'package:outernet/data/repository_implement/authorization_repo_impl.dart';
import 'package:outernet/domain/repositories/authorization_repository.dart';
import 'package:outernet/domain/usecases/authorization_usecase.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_bloc.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';

initAuthInjections() {
  sl.registerSingleton(PostgreSQLDatasource());
  sl.registerSingleton<AuthorizationRepository>(AuthorizationRepositoryImplement(sl()));
  sl.registerSingleton<AuthorizationUsecase>(AuthorizationUsecase(sl()));

  sl.registerFactory<AuthorizationBloc>(() => AuthorizationBloc(sl()));
}