import 'package:outernet/data/data_sources/dio_network/dio_network.dart';
import 'package:outernet/data/data_sources/remote_datasources/upload_api_implement.dart';
import 'package:outernet/data/repository_implement/upload_repo_impl.dart';
import 'package:outernet/presentation/blocs/media_bloc/media_bloc.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';

initMediaInjections() {
  sl.isRegistered<UploadApiImplement>() ? sl.get<UploadApiImplement>() : sl.registerSingleton(UploadApiImplement(DioNetwork.appAPI));
  sl.registerSingleton(UploadRepositoryImplement(sl()));
  sl.registerFactory<MediaBloc>(() => MediaBloc(sl()));
}