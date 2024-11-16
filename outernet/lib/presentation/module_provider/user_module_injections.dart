import 'package:outernet/data/data_sources/database_datasources.dart';
import 'package:outernet/data/repository_implement/user_repo_impl.dart';
import 'package:outernet/domain/repositories/user_repository.dart';
import 'package:outernet/domain/usecases/user_usecase.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_bloc.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';

initUserInjections() {
  sl.isRegistered<PostgreSQLDatasource>() ? sl.get<PostgreSQLDatasource>() : sl.registerSingleton(PostgreSQLDatasource());
  sl.registerSingleton<UserRepository>(UserRepositoryImplement(sl()));
  sl.registerSingleton<UserUsecase>(UserUsecase(sl()));

  sl.registerFactory<UserBloc>(() => UserBloc(sl()));
}