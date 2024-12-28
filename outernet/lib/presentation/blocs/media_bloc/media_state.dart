import 'package:outernet/domain/entities/media_entity.dart';

abstract class MediaState {}

class InitialMediaState extends MediaState {
  final List<MediaEntity>? media;

  InitialMediaState({this.media});
}

class UploadingMedia extends MediaState {}

class UploadMediaSuccess extends MediaState {
  final List<MediaEntity> medias;

  bool? isRecentlyUploadMedia;
  bool? isRecentlyAddMedia;
  bool? isRecentlyUpdateMedia;
  bool? isRecentlyDeleteMedia;
  bool? isRecentlyGetMediaDetail;
  
  final String? message;
  final String? error;

  UploadMediaSuccess._({
    required this.medias,
    this.isRecentlyUploadMedia = false,
    this.isRecentlyAddMedia = false,
    this.isRecentlyUpdateMedia = false,
    this.isRecentlyDeleteMedia = false,
    this.isRecentlyGetMediaDetail = false,
    this.message,
    this.error,
  });

  factory UploadMediaSuccess({
    required List<MediaEntity> medias,
    bool? isRecentlyUploadMedia,
    bool? isRecentlyAddMedia,
    bool? isRecentlyUpdateMedia,
    bool? isRecentlyDeleteMedia,
    bool? isRecentlyGetMediaDetail,
    String? message,
    String? error,
  }) {
    return UploadMediaSuccess._(
      medias: medias,
      isRecentlyUploadMedia: isRecentlyUploadMedia,
      isRecentlyAddMedia: isRecentlyAddMedia,
      isRecentlyUpdateMedia: isRecentlyUpdateMedia,
      isRecentlyDeleteMedia: isRecentlyDeleteMedia,
      isRecentlyGetMediaDetail: isRecentlyGetMediaDetail,
      message: message,
      error: error,
    );
  }

  UploadMediaSuccess copyWith({
    List<MediaEntity>? medias,
    bool? isRecentlyUploadMedia,
    bool? isRecentlyAddMedia,
    bool? isRecentlyUpdateMedia,
    bool? isRecentlyDeleteMedia,
    bool? isRecentlyGetMediaDetail,
    String? message,
    String? error,
  }) {
    return UploadMediaSuccess(
      medias: medias ?? this.medias,
      isRecentlyUploadMedia: isRecentlyUploadMedia ?? this.isRecentlyUploadMedia,
      isRecentlyAddMedia: isRecentlyAddMedia ?? this.isRecentlyAddMedia,
      isRecentlyUpdateMedia: isRecentlyUpdateMedia ?? this.isRecentlyUpdateMedia,
      isRecentlyDeleteMedia: isRecentlyDeleteMedia ?? this.isRecentlyDeleteMedia,
      isRecentlyGetMediaDetail: isRecentlyGetMediaDetail ?? this.isRecentlyGetMediaDetail,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }
}

class UploadMediaFailed extends MediaState {
  final String message;

  UploadMediaFailed(this.message);
}