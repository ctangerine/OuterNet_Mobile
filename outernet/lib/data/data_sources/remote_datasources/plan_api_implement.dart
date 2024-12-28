import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/data/data_sources/dio_network/base_api_service.dart';
import 'package:outernet/data/models/plan/plan_request_model.dart';
import 'package:outernet/data/models/plan/plan_response_model.dart';
import 'package:outernet/domain/entities/plan_entity.dart';

class PlanApiImplement extends BaseApiService {
  PlanApiImplement(super.dio);

  Future<String> addPlan(CreateOrUpdatePlanRequestModel request) async {
    return handleRequest(
      request: () => dio.post(ApiEndpoints.plan, data: request.toJson()),
      onSuccess: (_) {
        return 'Đã tạo kế hoạch thành công';
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }

  // Update Plan
  Future<String> updatePlan(CreateOrUpdatePlanRequestModel request, int planId) async {
    return handleRequest(
      request: () => dio.put('${ApiEndpoints.plan}/$planId', data: request.toJson()),
      onSuccess: (_) {
        return 'Đã cập nhật kế hoạch thành công';
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }

  // Delete Plan
  Future<String> deletePlan(int planId) async {
    return handleRequest(
      request: () => dio.delete('${ApiEndpoints.plan}/$planId'),
      onSuccess: (_) {
        return 'Đã xóa kế hoạch thành công';
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }

  // Get Specific Plan
  Future<PlanEntity> getPlan(int planId) async {
    return handleRequest(
      request: () => dio.get('${ApiEndpoints.plan}/$planId'),
      onSuccess: (response) {
        final plan = GetPlanResponseModel.fromJson(response.data).toEntity();

        return plan;
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => throw Exception('Đã có lỗi xảy ra: ${e.toString()}')
    );
  }

  // Remove Member from Plan - subdomain remove-member
  Future<String> removeMemberFromPlan(AddOrRemovePlanMemberRequestModel request, int planId) async {
    return handleRequest(
      request: () => dio.delete(
        '${ApiEndpoints.plan}/${request.planId}/${ApiEndpoints.removeMemberSubDomain}',
        data: {
          'userId': request.userId
        },
      ),
      onSuccess: (_) {
        return 'Đã xóa thành viên khỏi kế hoạch';
      },
      defaultErrorHandler: (response) =>
          ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}',
    );
  }


  // Add Member to Plan - subdomain add-member
  Future<String> addMemberToPlan(AddOrRemovePlanMemberRequestModel request, int planId) async {
    return handleRequest(
      request: () => dio.put(
        '${ApiEndpoints.plan}/$planId/${ApiEndpoints.addMemberSubDomain}',
        data: {
          'userId': request.userId
        },
      ),
      onSuccess: (_) {
        return 'Đã thêm thành viên vào kế hoạch';
      },
      defaultErrorHandler: (response) =>
          ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}',
    );
  }

  // Change role subdomain change-role
  Future<String> changeMemberRole(ChangeMemberRoleRequestModel request, int planId) async {
    return handleRequest(
      request: () => dio.put(
        '${ApiEndpoints.plan}/$planId/${ApiEndpoints.changeRoleSubDomain}',
        data: request.toJson(),
      ),
      onSuccess: (_) {
        return 'Đã thay đổi quyền thành công';
      },
      defaultErrorHandler: (response) =>
          ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}',
    );
  }

  // Add Site into Plan - subdomain add-site
  Future<String> addSiteToPlan(PlanSiteManagementRequestModel request, int planId) async {
    return handleRequest(
      request: () => dio.post(
        '${ApiEndpoints.plan}/$planId/${ApiEndpoints.addSiteSubDomain}',
        data: request.toJson(),
      ),
      onSuccess: (_) {
        return 'Đã thêm địa điểm vào kế hoạch';
      },
      defaultErrorHandler: (response) =>
          ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}',
    );
  }

  // Update Site
  Future<String> updateSiteInPlan(PlanSiteManagementRequestModel request, int planId) async {
    return handleRequest(
      request: () => dio.put(
        '${ApiEndpoints.plan}/$planId/${ApiEndpoints.updateSiteSubDomain}',
        data: request.toJson(),
      ),
      onSuccess: (_) {
        return 'Đã cập nhật địa điểm trong kế hoạch';
      },
      defaultErrorHandler: (response) =>
          ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}',
    );
  }

  // Remove Site from Plan
  Future<String> removeSiteFromPlan(PlanSiteManagementRequestModel request, int planId) async {
    return handleRequest(
      request: () => dio.delete(
        '${ApiEndpoints.plan}/$planId/${ApiEndpoints.removeSiteSubDomain}',
        data: request.toJson(),
      ),
      onSuccess: (_) {
        return 'Đã xóa địa điểm khỏi kế hoạch';
      },
      defaultErrorHandler: (response) =>
          ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}',
    );
  }

  // Get All Plan
  Future<List<PlanEntity>> getAllPlan() async {
    return handleRequest(
      request: () => dio.get(ApiEndpoints.plan),
      onSuccess: (response) {
        final plans = (response.data as List)
            .map((e) => GetPlanResponseModel.fromJson(e).toEntity())
            .toList();
        return plans;
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => throw Exception('Đã có lỗi xảy ra: ${e.toString()}')
    );
  }
}