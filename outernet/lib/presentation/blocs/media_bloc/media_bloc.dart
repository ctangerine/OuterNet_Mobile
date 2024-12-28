import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/repository_implement/upload_repo_impl.dart';
import 'package:outernet/presentation/blocs/media_bloc/media_events.dart';
import 'package:outernet/presentation/blocs/media_bloc/media_state.dart';

class MediaBloc extends Bloc<MediaEvents, MediaState> {
  final UploadRepositoryImplement mediaUsecase;

  MediaBloc(this.mediaUsecase) : super(InitialMediaState()) {
    on<UploadMedia>(_onUploadMedia);
  }

  Future<void> _onUploadMedia(UploadMedia event, Emitter<MediaState> emit) async {
    emit (UploadingMedia());
    final result = await mediaUsecase.uploadMedia(event.request);
    result.fold(
      (failure) => emit(UploadMediaFailed(failure.message)),
      (medias) {
        emit(UploadMediaSuccess(medias: medias, isRecentlyUploadMedia: true));
      }
    );
  }
}