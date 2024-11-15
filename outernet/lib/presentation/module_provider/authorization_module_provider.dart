

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:outernet/data/data_sources/database_datasources.dart';
import 'package:outernet/data/repos_implement/authorization_repos_implement.dart';
import 'package:outernet/domain/usecases/authorization_usecase.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_bloc.dart';

List<SingleChildWidget> authProviders() {
  return [
    ProxyProvider<PostgreSQLDatasource, AuthorizationRepositoryImplement>(
      update: (_, datasource, __) => AuthorizationRepositoryImplement(datasource),
    ),
    ProxyProvider<AuthorizationRepositoryImplement, AuthorizationUsecase>(
      update: (_, repository, __) => AuthorizationUsecase(repository),
    ),
    ProxyProvider<AuthorizationUsecase, AuthorizationBloc>(
      update: (_, usecase, __) => AuthorizationBloc(usecase),
    ),
  ];
}

// final sl = GetIt.instance;

