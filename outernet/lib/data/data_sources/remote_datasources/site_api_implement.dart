import 'package:dio/dio.dart';
import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database_provider.dart';
import 'package:outernet/data/models/site_type/sitetype_response_model.dart' as site_type;
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/data/models/sites/site_by_loc_response_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/data/models/sites/site_response_model.dart' as site_response;
import 'package:outernet/data/models/sites/site_review_response_model.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/env/log_service.dart';

final logger = LogService().logger;

class SiteApiImplement {
  final Dio dio;
  final AppDatabase _db = dbProvider.database;

  SiteApiImplement(this.dio);

  Future<String> addNewSite(AddNewSiteRequestModel request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.site,
        data: request.toJson(),
      );

      if (response.statusCode == 201) {
        return 'Đã tạo địa điểm thành công';
      } else {
        throw Exception('Không thể tạo địa điểm, mã lỗi: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SiteEntity> getPublicSite(int id) async {
    try {
      final response = await dio.get('${ApiEndpoints.site}/$id');
      
      final siteResponse = site_response.SiteResponseModel.fromJson(response.data);
      final site = siteResponse.toEntity();

      return site;
    }
    on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SiteEntity> updateSiteInfor(UpdateSiteRequestModel request) async {
    try {
      final response = await dio.put(
        '${ApiEndpoints.site}/${request.siteId}',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        final SiteEntity siteUpdated = await getPublicSite(request.siteId);

        try {
          await _db.upsertSite(siteUpdated.siteId, siteUpdated);
        } catch (e) {
          logger.e('Cannot save site to local database $e');
        }

        return siteUpdated;
      } else {
        throw Exception('Không thể cập nhật địa điểm, mã lỗi: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SiteEntity> getSiteByVersion(int version) async {
    try {
      final response = await dio.get('${ApiEndpoints.site}/?version=$version');
      
      final siteResponse = site_response.SiteResponseModel.fromJson(response.data);
      final site = siteResponse.toEntity();

      return site;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ReviewEntity>> getSiteReview(int siteId) async {
    try {
      final response = await dio.get('${ApiEndpoints.site}/$siteId/reviews');
      
      final List<ReviewEntity> reviews = SiteReviewResponseModel.fromJson(response.data).toEntities();

      return reviews;

    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SiteEntity>> getSiteByLoc(GetSitesByAreaRequestModel request) async {
    try {
      final response = await dio.get('${ApiEndpoints.site}/@?lat=${request.lat}&lng=${request.lng}&degRadius=${request.degRadius}');
      
      final List<SiteEntity> sites = SiteByLocResponseModel.fromJson(response.data).toEntities();

      for (SiteEntity site in sites) {
        final SiteEntity detail = await getPublicSite(site.siteId!);
        site.copyWith(medias: detail.medias);
      }

      return sites;

    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<GroupedService>> getAllServices(int typeId) async {
    try {
      final response = await dio.get('api/site-types/$typeId/services');
      
      final List<GroupedService> services = site_type.SiteTypeGroupServicesResponseModel.fromJson(response.data).getGroupedServiceList();

      return services;

    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SiteType>> getAllSiteType() async {
    try {
      final response = await dio.get('api/site-types');
      
      final List<SiteType> siteTypes = site_type.GetAllSiteTypeResponseModel.fromJson(response.data).getSiteTypeList();

      return siteTypes;

    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

