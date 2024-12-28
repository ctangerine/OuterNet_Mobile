import 'package:dartz/dartz.dart';
import 'package:outernet/data/data_sources/remote_datasources/upload_api_implement.dart';
import 'package:outernet/data/models/medias/media_request_model.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/entities/media_entity.dart';

class UploadRepositoryImplement {
  final UploadApiImplement _api;

  UploadRepositoryImplement(this._api);

  Future<Either<Failure, List<MediaEntity>>> uploadMedia(UploadFileRequestModel request) async {
    try {
      final response = await _api.uploadFile(request);
      return Right(response);
    } catch (e) {
      return Left(FetchDataFailure('Fail to upload media $e'));
    }
  }
}