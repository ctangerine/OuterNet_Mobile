import 'package:outernet/data/data_sources/dio_network/dio_network.dart';
import 'package:outernet/data/data_sources/remote_datasources/site_review_api_implement.dart';
import 'package:outernet/data/repository_implement/site_review_repo_imple.dart';
import 'package:outernet/domain/repositories/site_review_respository.dart';
import 'package:outernet/domain/usecases/site_review_usecase.dart';
import 'package:outernet/presentation/blocs/site_review_bloc/site_review_bloc.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';

initSiteReviewInjection() {
  sl.isRegistered<SiteReviewApiImplement>() ? sl.get<SiteReviewApiImplement>() : sl.registerSingleton(SiteReviewApiImplement(DioNetwork.appAPI));
  sl.registerSingleton<SiteReviewRespository>(SiteReviewRepositoryImplement(sl()));
  sl.registerSingleton<SiteReviewUsecase>(SiteReviewUsecase(sl()));

  sl.registerFactory<SiteReviewBloc>(() => SiteReviewBloc(sl()));
}