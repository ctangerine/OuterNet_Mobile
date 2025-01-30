import 'package:outernet/data/models/report/report_response_model.dart';

abstract class ReportState {}

class InitialReportState extends ReportState {
  final CategoryResponseModel? reports;

  InitialReportState({this.reports});
}

class LoadReportCategoriesSuccess extends ReportState {
  final CategoryResponseModel reports;

  bool? isRecentlyGetCategories;
  bool? isRecentlyReportSite;
  bool? isRecentlyReportUser;
  bool? isRecentlyReportSiteReview;

  String? message;
  String? error;

  LoadReportCategoriesSuccess._({
    required this.reports,
    this.isRecentlyGetCategories = false,
    this.isRecentlyReportSite = false,
    this.isRecentlyReportUser = false,
    this.isRecentlyReportSiteReview = false,
    this.message,
    this.error,
  });

  factory LoadReportCategoriesSuccess({
    required CategoryResponseModel reports,
    bool? isRecentlyGetCategories,
    bool? isRecentlyReportSite,
    bool? isRecentlyReportUser,
    bool? isRecentlyReportSiteReview,
    String? message,
    String? error,
  }) {
    return LoadReportCategoriesSuccess._(
      reports: reports,
      isRecentlyGetCategories: isRecentlyGetCategories,
      isRecentlyReportSite: isRecentlyReportSite,
      isRecentlyReportUser: isRecentlyReportUser,
      isRecentlyReportSiteReview: isRecentlyReportSiteReview,
      message: message,
      error: error,
    );
  }

  LoadReportCategoriesSuccess copyWith({
    CategoryResponseModel? reports,
    bool? isRecentlyGetCategories,
    bool? isRecentlyReportSite,
    bool? isRecentlyReportUser,
    bool? isRecentlyReportSiteReview,
    String? message,
    String? error,
  }) {
    return LoadReportCategoriesSuccess._(
      reports: reports ?? this.reports,
      isRecentlyGetCategories: isRecentlyGetCategories ?? this.isRecentlyGetCategories,
      isRecentlyReportSite: isRecentlyReportSite ?? this.isRecentlyReportSite,
      isRecentlyReportUser: isRecentlyReportUser ?? this.isRecentlyReportUser,
      isRecentlyReportSiteReview: isRecentlyReportSiteReview ?? this.isRecentlyReportSiteReview,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }

  static LoadReportCategoriesSuccess defaultInstance = LoadReportCategoriesSuccess._(
    reports: CategoryResponseModel.defaultInstance,
  );
}

class LoadCategoriesFailed extends ReportState {
  final String error;

  LoadCategoriesFailed(this.error);
}

class ReportSuccess extends ReportState {
  final String message;

  ReportSuccess(this.message);
}

class ReportFailed extends ReportState {
  final String error;

  ReportFailed(this.error);
}

class Loading extends ReportState {}