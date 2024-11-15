import 'package:outernet/data/data_sources/database_datasources.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:outernet/data/repository_implement/user_repo_impl.dart';
import 'package:outernet/domain/usecases/user_usecase.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_bloc.dart';

List<SingleChildWidget> userProviders() {
  return [
    ProxyProvider<PostgreSQLDatasource, UserRepositoryImplement>(
      update: (_, datasource, __) => UserRepositoryImplement(datasource),
    ),
    ProxyProvider<UserRepositoryImplement, UserUsecase>(
      update: (_, repository, __) => UserUsecase(repository),
    ),
    ProxyProvider<UserUsecase, UserBloc>(
      update: (_, usecase, __) => UserBloc(usecase),
    ),
  ];
}