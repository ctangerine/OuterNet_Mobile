import 'package:dio/dio.dart';
import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/data/models/site_review/site_review_request_model.dart';
import 'package:outernet/data/models/site_review/site_review_response_model.dart';

class SiteReviewApiImplement {
  final Dio dio;

  SiteReviewApiImplement(this.dio);

  Future<String> addSiteReview(SiteReviewRequestModel request) async {
    try {
      final imagesUrl = request.images ?? [];
      final videosUrl = request.videos ?? [];

      final formData = FormData.fromMap({
        'images': List.generate(
          imagesUrl.length,
          (index) => MultipartFile.fromFileSync(
            imagesUrl[index],
            filename: imagesUrl[index].split('/').last,
          ),
        ),
        'videos': List.generate(
          videosUrl.length,
          (index) => MultipartFile.fromFileSync(
            videosUrl[index],
            filename: videosUrl[index].split('/').last,
          ),
        ),
        'review': request.review,
      });

      final response = await dio.post(
        ApiEndpoints.siteReview,
        data: formData,
      );

      return response.data['message'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DetailReviewResponseModel> getDetailReview(int reviewId) async {
    try {
      final response = await dio.get('${ApiEndpoints.siteReview}/$reviewId');
      return DetailReviewResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> updateReview(SiteReviewRequestModel request, int reviewId) async {
    try {
      final imagesUrl = request.images ?? [];
      final videosUrl = request.videos ?? [];

      final formData = FormData.fromMap({
        'images': List.generate(
          imagesUrl.length,
          (index) => MultipartFile.fromFileSync(
            imagesUrl[index],
            filename: imagesUrl[index].split('/').last,
          ),
        ),
        'videos': List.generate(
          videosUrl.length,
          (index) => MultipartFile.fromFileSync(
            videosUrl[index],
            filename: videosUrl[index].split('/').last,
          ),
        ),
        'review': request.review,
      });

      final response = await dio.put(
        '${ApiEndpoints.siteReview}/$reviewId',
        data: formData,
      );

      return response.data['message'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> deleteReview(int reviewId) async {
    try {
      final response = await dio.delete('${ApiEndpoints.siteReview}/$reviewId');
      return response.data['message'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}