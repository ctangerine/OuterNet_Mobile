import 'package:outernet/data/models/medias/media_request_model.dart';

abstract class MediaEvents {}

class LoadMediaList extends MediaEvents {}

class UploadMedia extends MediaEvents {
  final UploadFileRequestModel request;

  UploadMedia(this.request);
}