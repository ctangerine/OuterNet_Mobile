import 'package:dio/dio.dart';
import 'package:outernet/data/constant/endpoints.dart';
import 'package:outernet/data/models/medias/media_request_model.dart';
import 'package:outernet/domain/entities/media_entity.dart';

class UploadApiImplement {
  final Dio dio;

  UploadApiImplement(this.dio);

  Future<List<MediaEntity>> uploadFile(UploadFileRequestModel request) async {
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

      final data =response.data as List;
      final List<MediaEntity> medias = data.map((e) {
        return MediaEntity.defaultInstance.copyWith(
          idStr: e['id'],
          url: e['url'],
        );
      }).toList();

      return medias;
    }
    on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}