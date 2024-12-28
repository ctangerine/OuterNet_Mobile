import 'package:dio/dio.dart';
import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/data/data_sources/dio_network/base_api_service.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database_provider.dart';
import 'package:outernet/data/models/user/user_request_model.dart';
import 'package:outernet/data/models/user/user_response_model.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/env/log_service.dart';

final logger = LogService().logger;

class UserApiImplement extends BaseApiService {
  final AppDatabase _db = dbProvider.database;

  UserApiImplement(super.dio);

  Future<UserEntity> addUserName(String name) async {
    return UserEntity(nickname: name, id: 1);
  }

  Future<String> changePassword(ChangePasswordRequestModel request) async {
    return handleRequest(
      request: () => dio.put(ApiEndpoints.changePassword, data: request.toJson()),
      onSuccess: (_) => "Mật khẩu đã được thay đổi",
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }

  Future<String> updateAvatar(UpdateAvatarRequestModel request) async {
    final formData = FormData.fromMap({
      'avatar': MultipartFile.fromFileSync(
        request.avatar,
        filename: request.avatar.split('/').last,
      ),
    });

    return handleRequest(
      request: () => dio.put(ApiEndpoints.avatar, data: formData),
      onSuccess: (response) {
        final avatar = response.data['data']['avatar'];
        _updateLocalUserAvatar(avatar);
        return 'Ảnh đại diện đã được thay đổi';
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }

  Future<void> _updateLocalUserAvatar(String avatar) async {
    final user = await _db.getCurrentUser();
    try {
      await _db.upsertUser(user!.id, user.copyWith(avatar: avatar));
    } catch (e) {
      logger.e('Cannot save avatar to local user database $e');
    }
  }

  Future<String> updateBasicInfo(UpdateBasicInfoRequestModel request) async {
    return handleRequest(
      request: () => dio.put(ApiEndpoints.basicInfo, data: request.toJson()),
      onSuccess: (_) {
        _updateUserBasicInfo(request);
        return 'Thông tin đã được cập nhật';
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }

  Future<void> _updateUserBasicInfo(UpdateBasicInfoRequestModel request) async {
    final user = await _db.getCurrentUser();
    try {
      await _db.upsertUser(
          user!.id,
          user.copyWith(
            nickname: request.nickname,
            fullName: request.fullName,
          ));
    } catch (e) {
      logger.e('Cannot save basic info to local user database $e');
    }
  }

  Future<String> updateDetailInfo(UpdateDetailInfoRequestModel request) async {
    return handleRequest(
      request: () => dio.put(ApiEndpoints.detailInfo, data: request.toJson()),
      onSuccess: (_) {
        _updateUserDetailInfo(request);
        return 'Thông tin đã được cập nhật';
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }

  Future<void> _updateUserDetailInfo(UpdateDetailInfoRequestModel request) async {
    final user = await _db.getCurrentUser();
    try {
      await _db.upsertUser(
        user!.id,
        user.copyWith(
          address: request.address,
          birthDate: DateTime.parse(request.birthDate),
          phoneNumber: request.phoneNumber,
          gender: request.gender,
          socialUrl: request.socialUrl,
        ),
      );
    } catch (e) {
      logger.e('Cannot save detail info to local user database $e');
    }
  }

  Future<String> updateEmail(UpdateEmailRequestModel request) async {
    return handleRequest(
      request: () => dio.put(ApiEndpoints.email, data: request.toJson()),
      onSuccess: (_) {
        _updateLocalUserEmail(request);
        return 'Email đã được cập nhật';
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }

  Future<void> _updateLocalUserEmail(UpdateEmailRequestModel request) async {
    final user = await _db.getCurrentUser();
    try {
      await _db.upsertUser(user!.id, user.copyWith(email: request.email));
    } catch (e) {
      logger.e('Cannot save email to local user database $e');
    }
  }

  Future<String> deactivateAccount() async {
    return handleRequest(
      request: () => dio.put(ApiEndpoints.unactivated),
      onSuccess: (_) {
        return 'Tài khoản đã được vô hiệu hóa';
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => 'Đã có lỗi xảy ra: ${e.toString()}'
    );
  }

  Future<UserEntity> getUserDetail() async {
    return handleRequest(
      request: () => dio.get(ApiEndpoints.detailInfo),
      onSuccess: (response) {
        final user = GetUserDetailResponseModel.fromJson(response.data).toEntity();
        _updateLocalUser(user);
        return user;
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => throw Exception('Đã có lỗi xảy ra: ${e.toString()}')
    );
  }

  Future<void> _updateLocalUser(UserEntity user) async {
    final currentUser = await _db.getCurrentUser();
    try {
      await _db.upsertUser(currentUser!.id, user);
    } catch (e) {
      await _db.upsertUser(null,user);
    }
  }

  Future<UserEntity> getOtherUser(int userId) async {
    return handleRequest(
      request: () => dio.get('${ApiEndpoints.user}/$userId'),
      onSuccess: (response) {
        final user = GetUserDetailResponseModel.fromJson(response.data).toEntity();
        return user;
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => throw Exception('Đã có lỗi xảy ra: ${e.toString()}')
    );
  }

  Future<List<UserEntity>> searchUser(SearchUserRequestModel request) {
    return handleRequest(
      request: () => dio.get(ApiEndpoints.searchUser, queryParameters: request.toJson()),
      onSuccess: (response) {
        final users = SearchUserResponseModel.fromJson(response.data).toEntities();
        return users;
      },
      defaultErrorHandler: (response) => ErrorResponseMapper.mapError(response?.statusCode, response),
      onCatchError: (e) => throw Exception('Đã có lỗi xảy ra: ${e.toString()}')
    );
  }
}
