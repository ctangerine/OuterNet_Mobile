import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/data/data_sources/dio_network/base_api_service.dart';
import 'package:outernet/data/models/report/report_request_model.dart';
import 'package:outernet/data/models/report/report_response_model.dart';

class ReportApiImplement extends BaseApiService {
  ReportApiImplement(super.dio);

  Future<CategoryResponseModel> GetSiteReportCategories() async {
    return handleRequest(
      request: () => dio.get(ApiEndpoints.siteReportCategories),
      onSuccess: (response) {
        try {
          final categories = (response.data as List).map((e) => Category.fromJson(e)).toList();
          return CategoryResponseModel(categories: categories);
        } catch (e) {
          logger.e('Error: $e');
          throw Exception('Đã có lỗi xảy ra: ${e.toString()}');
        }
        // final categories = CategoryResponseModel.fromJson(response.data);
        // logger.d('categories: $categories');
        // return categories;
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => throw Exception('Đã có lỗi xảy ra: ${e.toString()}')
    );
  }

  Future<CategoryResponseModel> GetUserReportCategories() async {
    return handleRequest(
      request: () => dio.get(ApiEndpoints.userReportCategories),
      onSuccess: (response) {
        final categories = (response.data as List).map((e) => Category.fromJson(e)).toList();
        return CategoryResponseModel(categories: categories);
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => throw Exception('Đã có lỗi xảy ra: ${e.toString()}')
    );
  }

  Future<CategoryResponseModel> GetSiteReviewReportCategories() async {
    return handleRequest(
      request: () => dio.get(ApiEndpoints.reviewReprotCategories),
      onSuccess: (response) {
        final categories = (response.data as List).map((e) => Category.fromJson(e)).toList();
        return CategoryResponseModel(categories: categories);
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => throw Exception('Đã có lỗi xảy ra: ${e.toString()}')
    );
  }

  Future<String> ReportSite(SiteReportRequestModel request) async {
    return handleRequest(
      request: () => dio.post(ApiEndpoints.siteReport, data: request.toJson()),
      onSuccess: (_) {
        return 'Báo cáo đã được gửi';
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }

  Future<String> ReportUser(UserReportRequestModel request) async {
    return handleRequest(
      request: () => dio.post(ApiEndpoints.userReport, data: request.toJson()),
      onSuccess: (_) {
        return 'Báo cáo đã được gửi';
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }

  Future<String> ReportSiteReview(SiteReviewReportRequestModel request) async {
    return handleRequest(
      request: () => dio.post(ApiEndpoints.siteReviewReport, data: request.toJson()),
      onSuccess: (_) {
        return 'Báo cáo đã được gửi';
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }
}