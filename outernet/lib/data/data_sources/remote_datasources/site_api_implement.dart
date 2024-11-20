import 'package:dio/dio.dart';
import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/data/models/site_type/sitetype_response_model.dart';
import 'package:outernet/data/models/sites/site_by_loc_response_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/data/models/sites/site_review_response_model.dart';
import 'package:outernet/env/log_service.dart';

class SiteApiImplement {
  final Dio dio;

  SiteApiImplement(this.dio);

  Future<SiteResponseModel> addNewSite(AddNewSiteRequestModel request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.site,
        data: request.toJson(),
      );

      return SiteResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SiteResponseModel> getPublicSite(int id) async {
    try {
      final respone = await dio.get('${ApiEndpoints.site}/$id');
      LogService().logger.i('Get public site response id: $respone.data["siteId"]');
      return SiteResponseModel.fromJson(respone.data);
    }
    on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SiteResponseModel> updateSiteInfor(UpdateSiteRequestModel request) async {
    try {
      final response = await dio.put(
        '${ApiEndpoints.site}/${request.siteId}',
        data: request.toJson(),
      );

      return SiteResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SiteResponseModel> getSiteByVersion(int version) async {
    try {
      final response = await dio.get('${ApiEndpoints.site}/?version=$version');
      return SiteResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SiteReviewResponseModel> getSiteReview(int siteId) async {
    try {
      final response = await dio.get('${ApiEndpoints.site}/$siteId/reviews');
      return SiteReviewResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SiteResponseModel>> getListSite() async {
    try {
      final response = await dio.get(ApiEndpoints.site);
      return (response.data as List)
          .map((e) => SiteResponseModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SiteTypeGroupServicesResponseModel> getSiteTypeGroupServices() async {
    try {
      final response = await dio.get('${ApiEndpoints.siteType }/services');
      return SiteTypeGroupServicesResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SiteByLocResponseModel> getSiteByLoc(GetSiteRequestModel request) async {
    try {
      final response = await dio.get('${ApiEndpoints.site}/@?lat=${request.lat}&lng=${request.lng}&degRadius=${request.degRadius}');
      return SiteByLocResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

