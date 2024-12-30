import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/data_sources/dio_network/base_api_service.dart';
import 'package:outernet/domain/entities/site_entity.dart';
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
    on<GetAllGroupedService>(_onGetAllGroupServices);
    on<GetAllSiteType>(_onGetAllSiteType);
    on<GetDiscoverySites>(_onGetDiscoverySites);
  }

  Future<void> _onLoadListSite(LoadListSite event, Emitter<SiteState> emit) async {
    emit(SiteLoading());
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
          emit(LoadListSiteSuccess(sites: [], siteDetail: site, siteReview: [], isSiteDetailChanged: true));
        }
      }
    );
  }

  Future<void> _onAddSite(AddSite event, Emitter<SiteState> emit) async {
    final result = await siteUsecase.addNewSite(event.site);
    result.fold(
      (failure) => emit((state as LoadListSiteSuccess).copyWith(message: failure.message)),
      (site) {
        if (state is LoadListSiteSuccess) {
          emit((state as LoadListSiteSuccess).copyWith(message: site, isNewlyAddedSite: true));
        }
        else {
          emit(LoadListSiteSuccess(sites: [], message: site, siteReview: [], isNewlyAddedSite: true));
        }
      }
    );
  }

  Future<void> _onUpdateSite(UpdateSite event, Emitter<SiteState> emit) async {
    final result = await siteUsecase.updateSiteInfo(event.site);
    result.fold(
      (failure) => emit(LoadListSiteFailed(failure.message)),
      (site) {
        if (state is LoadListSiteSuccess) {
          emit((state as LoadListSiteSuccess).copyWith(siteDetail: site, isSiteRecentlyUpdate: true));
        }
        else {
          emit(LoadListSiteSuccess(sites: [], siteDetail: site, siteReview: [], isSiteRecentlyUpdate: true));
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
        else {
          emit(LoadListSiteSuccess(sites: [], siteDetail: site, siteReview: [], isSiteDetailChanged: true));
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
        else {
          emit(LoadListSiteSuccess(sites: [], siteDetail: SiteEntity.defaultInstance, siteReview: siteReview, isSiteReviewChanged: true));
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
        if (state is LoadListSiteSuccess) {
          emit((state as LoadListSiteSuccess).copyWith(siteByLoc: siteByLoc, isSiteByLocChanged: true));
        } else {
          emit(LoadListSiteSuccess(sites: sites, siteByLoc: siteByLoc, siteReview: [], isSiteByLocChanged: true));
        }
      }
    );
  }

  Future<void> _onGetAllGroupServices(GetAllGroupedService event, Emitter<SiteState> emit) async {
    final result = await siteUsecase.getAllGroupedService(event.id);
    result.fold(
      (failure) => emit(LoadListSiteFailed(failure.message)),
      (groupedServices) {
        try {
          emit((state as LoadListSiteSuccess).copyWith(groupedServices: groupedServices, isGotGroupedService: true));
        } catch (e) {
          emit(LoadListSiteSuccess(sites: [], groupedServices: groupedServices, isGotGroupedService: true));
        }
      }
    );
  }

  Future<void> _onGetAllSiteType(GetAllSiteType event, Emitter<SiteState> emit) async {
    final result = await siteUsecase.getAllSiteType();
    result.fold(
      (failure) => emit(LoadListSiteFailed(failure.message)),
      (siteTypes) {
        try {
          emit((state as LoadListSiteSuccess).copyWith(siteTypes: siteTypes, isGotGroupedService: true));
        } catch (e) {
          emit(LoadListSiteSuccess(sites: [], siteTypes: siteTypes, isGotGroupedService: true));
        }
      }
    );
  }

  Future<void> _onGetDiscoverySites(GetDiscoverySites event, Emitter<SiteState> emit) async {
    final result = await siteUsecase.getDiscoverySites(event.id);
    result.fold(
      (failure) => emit(LoadListSiteFailed(failure.message)),
      (sites) {
        logger.f('I called oke');
        try {
          emit((state as LoadListSiteSuccess).copyWith(sites: sites, isListRecentlyChanged: true, message: null));
        } catch (e) {
          emit(LoadListSiteSuccess(sites: sites, isListRecentlyChanged: true));
        }
      }
    );
  }
}