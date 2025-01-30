import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/domain/usecases/report_usecase.dart';
import 'package:outernet/presentation/blocs/report_bloc/report_events.dart';
import 'package:outernet/presentation/blocs/report_bloc/report_state.dart';

class ReportBloc extends Bloc<ReportEvents, ReportState> {
  final ReportUsecase reportUsecase;

  ReportBloc(this.reportUsecase): super(InitialReportState()) {
    on<LoadSiteReportCategories>(_onGetSiteReportCategories);
    on<LoadUserReportCategories>(_onGetUserReportCategories);
    on<LoadSiteReviewReportCategories>(_onGetSiteReviewReportCategories);
    on<ReportSite>(_onReportSite);
    on<ReportUser>(_onReportUser);
    on<ReportSiteReview>(_onReportSiteReview);
  }

  

  Future<void> _onGetSiteReportCategories(LoadSiteReportCategories event, Emitter<ReportState> emit) async {
    emit(Loading());

    final result = await reportUsecase.getSiteReportCategories();
    result.fold(
      (failure) => emit(LoadCategoriesFailed(failure.message)),
      (data) => emit(LoadReportCategoriesSuccess(reports: data, isRecentlyGetCategories: true)),
    );
  }

  Future<void> _onGetUserReportCategories(LoadUserReportCategories event, Emitter<ReportState> emit) async {
    emit(Loading());

    final result = await reportUsecase.getUserReportCategories();
    result.fold(
      (failure) => emit(LoadCategoriesFailed(failure.message)),
      (data) => emit(LoadReportCategoriesSuccess(reports: data, isRecentlyGetCategories: true)),
    );
  }

  Future<void> _onGetSiteReviewReportCategories(LoadSiteReviewReportCategories event, Emitter<ReportState> emit) async {
    emit(Loading());

    final result = await reportUsecase.getSiteReviewReportCategories();
    result.fold(
      (failure) => emit(LoadCategoriesFailed(failure.message)),
      (data) => emit(LoadReportCategoriesSuccess(reports: data, isRecentlyGetCategories: true)),
    );
  }

  Future<void> _onReportSite(ReportSite event, Emitter<ReportState> emit) async {
    emit(Loading());

    final result = await reportUsecase.reportSite(event.request);
    result.fold(
      (failure) => emit(ReportFailed(failure.message)),
      (data) => emit(ReportSuccess(data)),
    );
  }

  Future<void> _onReportUser(ReportUser event, Emitter<ReportState> emit) async {
    emit(Loading());

    final result = await reportUsecase.reportUser(event.request);
    result.fold(
      (failure) => emit(ReportFailed(failure.message)),
      (data) => emit(ReportSuccess(data)),
    );
  }

  Future<void> _onReportSiteReview(ReportSiteReview event, Emitter<ReportState> emit) async {
    emit(Loading());

    final result = await reportUsecase.reportSiteReview(event.request);
    result.fold(
      (failure) => emit(ReportFailed(failure.message)),
      (data) => emit(ReportSuccess(data)),
    );
  }
} 