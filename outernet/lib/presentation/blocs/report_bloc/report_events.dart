import 'package:outernet/data/models/report/report_request_model.dart';

abstract class ReportEvents {}

class LoadSiteReportCategories extends ReportEvents {}

class LoadUserReportCategories extends ReportEvents {}

class LoadSiteReviewReportCategories extends ReportEvents {}

class ReportSite extends ReportEvents {
  final SiteReportRequestModel request;

  ReportSite(this.request);
}

class ReportUser extends ReportEvents {
  final UserReportRequestModel request;

  ReportUser(this.request);
}

class ReportSiteReview extends ReportEvents {
  final SiteReviewReportRequestModel request;

  ReportSiteReview(this.request);
}

