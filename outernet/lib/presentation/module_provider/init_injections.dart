import 'package:get_it/get_it.dart';
import 'package:outernet/data/data_sources/dio_network/dio_network.dart';
import 'package:outernet/presentation/module_provider/auth_module_injections.dart';
import 'package:outernet/presentation/module_provider/dependencies_injection.dart';
import 'package:outernet/presentation/module_provider/user_module_injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initSharedPrefsInjections();
  await initAppInjections();
  await initDioInjections();
  await initAuthInjections();
  await initUserInjections();
}



initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  await sl.isReady<SharedPreferences>();
}

Future<void> initDioInjections() async {
  DioNetwork.initDio();
}
