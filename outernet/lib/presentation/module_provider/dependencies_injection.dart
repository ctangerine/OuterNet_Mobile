import 'package:outernet/data/data_sources/shared_preferences.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';

initAppInjections() {
  sl.registerFactory<AppSharedPreferences>(() => AppSharedPreferences(sl()));
}