import 'package:dio/dio.dart';
import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/data/models/user/user_request_model.dart';

class UploadApiImplement {
  final Dio dio;

  UploadApiImplement(this.dio);

  Future<String> uploadFile(UploadFileRequestModel request) async {
    try {
      final filepaths = request.files;
      final filenames = filepaths.map((e) => e.split('/').last).toList();
      final formData = FormData.fromMap({
        'files': List.generate(
          filepaths.length,
          (index) => MultipartFile.fromFileSync(
            filepaths[index],
            filename: filenames[index],
          ),
        ),
      });

      final response = await dio.post(
        ApiEndpoints.updload,
        data: formData,
      );

      return response.data['message'];
    }
    on DioError catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}