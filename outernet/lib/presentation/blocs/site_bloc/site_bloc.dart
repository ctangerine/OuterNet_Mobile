import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/data/models/sites/site_review_response_model.dart';
import 'package:outernet/domain/usecases/site_usecase.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';

class SiteBloc extends Bloc<SiteEvent, SiteState> {
  final SiteUsecase siteUsecase;

  SiteBloc(this.siteUsecase) : super(InitialSiteState()) {
    on<LoadListSite>(_onLoadListSite);
    on<LoadSiteDetail>(_onLoadSiteDetail);
    on<AddSite>(_onAddSite);
    on<UpdateSite>(_onUpdateSite);
    //on<DeleteSite>(_onDeleteSite);
    on<GetSiteVersion>(_onGetSiteVersion);
    on<GetSiteReview>(_onGetSiteReview);
    on<GetSiteByLocation>(_onGetSiteByLocation);
  }

  Future<void> _onLoadListSite(LoadListSite event, Emitter<SiteState> emit) async {
    emit(SiteLoading());
    final result = await siteUsecase.getListSite();
    result.fold(
      (failure) => emit(LoadListSiteFailed(failure.message)),
      (sites) {
        final siteDetail = SiteResponseModel.defaultInstance;
        emit(LoadListSiteSuccess(sites: sites, siteDetail: siteDetail));
      }
    );
  }

  Future<void> _onLoadSiteDetail(LoadSiteDetail event, Emitter<SiteState> emit) async {
    final result = await siteUsecase.getPublicSite(event.siteId);
    result.fold(
      (failure) => emit(LoadListSiteFailed(failure.message)),
      (site) {
        if (state is LoadListSiteSuccess) {
          emit((state as LoadListSiteSuccess).copyWith(siteDetail: site, isSiteDetailChanged: true));
        }
        else {
          emit(LoadListSiteSuccess(sites: [], siteDetail: site, siteReview: SiteReviewResponseModel.defaultInstance, isSiteDetailChanged: true));
        }
      }
    );
  }

  Future<void> _onAddSite(AddSite event, Emitter<SiteState> emit) async {
    final result = await siteUsecase.addNewSite(event.site);
    result.fold(
      (failure) => emit(LoadListSiteFailed(failure.message)),
      (site) {
        if (state is LoadListSiteSuccess) {
          emit((state as LoadListSiteSuccess).copyWith(siteDetail: site, isNewlyAddedSite: true));
        }
      }
    );
  }

  Future<void> _onUpdateSite(UpdateSite event, Emitter<SiteState> emit) async {
    final result = await siteUsecase.updateSiteInfor(event.site);
    result.fold(
      (failure) => emit(LoadListSiteFailed(failure.message)),
      (site) {
        if (state is LoadListSiteSuccess) {
          emit((state as LoadListSiteSuccess).copyWith(siteDetail: site, isSiteRecentlyUpdate: true));
        }
      }
    );
  }

  // Future<void> _onDeleteSite(DeleteSite event, Emitter<SiteState> emit) async {
  //   final result = await siteUsecase.deleteSite(event.siteId);
  //   result.fold(
  //     (failure) => emit(LoadListSiteFailed(failure.message)),
  //     (site) {
  //       if (state is LoadListSiteSuccess) {
  //         emit((state as LoadListSiteSuccess).copyWith(isSiteRecentlyChanged: true));
  //       }
  //     }
  //   );
  // }

  Future<void> _onGetSiteVersion(GetSiteVersion event, Emitter<SiteState> emit) async {
    final result = await siteUsecase.getSiteByVersion(event.version);
    result.fold(
      (failure) => emit(LoadListSiteFailed(failure.message)),
      (site) {
        if (state is LoadListSiteSuccess) {
          emit((state as LoadListSiteSuccess).copyWith(siteDetail: site, isSiteDetailChanged: true));
        }
      }
    );
  }

  Future<void> _onGetSiteReview(GetSiteReview event, Emitter<SiteState> emit) async {
    final result = await siteUsecase.getSiteReview(event.siteId);
    result.fold(
      (failure) => emit(LoadListSiteFailed(failure.message)),
      (siteReview) {
        if (state is LoadListSiteSuccess) {
          emit((state as LoadListSiteSuccess).copyWith(siteReview: siteReview, isSiteReviewChanged: true));
        }
      }
    );
  }

  Future<void> _onGetSiteByLocation(GetSiteByLocation event, Emitter<SiteState> emit) async {
    final result = await siteUsecase.getSiteByLocation(event.request);
    result.fold(
      (failure) => emit(LoadListSiteFailed(failure.message)),
      (sites) {
        final siteByLoc = sites;
        emit((state as LoadListSiteSuccess).copyWith(siteByLoc: siteByLoc, isSiteByLocChanged: true));
      }
    );
  }
}