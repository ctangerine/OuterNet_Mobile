import 'package:dio/dio.dart';
import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database_provider.dart';
import 'package:outernet/data/models/site_review/site_review_request_model.dart';
import 'package:outernet/data/models/site_review/site_review_response_model.dart';
import 'package:outernet/data/models/sites/site_review_response_model.dart';
import 'package:outernet/domain/entities/review_entity.dart';

class SiteReviewApiImplement {
  final Dio dio;
  final AppDatabase _db = dbProvider.database;

  SiteReviewApiImplement(this.dio);

  Future<String> addSiteReview(ReviewSiteRequestModel request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.siteReview,
        data: request.toJson(),
      );

      if (response.statusCode == 201) {
        return 'Đã tạo đánh giá thành công';
      } else {
        throw Exception('Không thể tạo đánh giá, mã lỗi: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ReviewEntity> getDetailReview(int reviewId) async {
    try {
      final response = await dio.get('${ApiEndpoints.siteReview}/$reviewId');
      final review = DetailReviewResponseModel.fromJson(response.data).toEntity();

      if (response.statusCode == 200) {
        return review;
      } else {
        throw Exception('Không thể lấy thông tin đánh giá, mã lỗi: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> updateReview(UpdateReviewRequestModel request, int reviewId) async {
    try {
      final response = await dio.put(
        '${ApiEndpoints.siteReview}/$reviewId',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return 'Đã cập nhật đánh giá thành công';
      } else {
        throw Exception('Không thể cập nhật đánh giá, mã lỗi: ${response.statusCode}');
      }

    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> deleteReview(int reviewId) async {
    try {
      final response = await dio.delete('${ApiEndpoints.siteReview}/$reviewId');
      if (response.statusCode == 204) {
        return 'Đã xóa đánh giá thành công';
      } else {
        throw Exception('Không thể xóa đánh giá, mã lỗi: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ReviewEntity>> getMyReview() async {
    try {
      final response = await dio.get('${ApiEndpoints.siteReview}/my-reviews');

      if (response.statusCode == 200) {
        final reviewResponse = SiteReviewResponseModel.fromJson(response.data).toEntities();
        return reviewResponse;
      } else {
        throw Exception('Không thể lấy thông tin đánh giá, mã lỗi: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}