

import 'package:get_it/get_it.dart';
import 'package:outernet/data/data_sources/database_datasources.dart';

void setupAuthorizationDependencies() {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton( () => PostgreSQLDatasource());
}