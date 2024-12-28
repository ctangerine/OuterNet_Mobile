import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:outernet/data/models/medias/media_request_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/env/log_service.dart';
import 'package:outernet/presentation/blocs/media_bloc/media_bloc.dart';
import 'package:outernet/presentation/blocs/media_bloc/media_events.dart';
import 'package:outernet/presentation/blocs/media_bloc/media_state.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';
import 'package:outernet/presentation/ui_component_resused/video_player.dart';

class AddSitePhotos extends StatefulWidget {
  final int index;
  final AddNewSiteRequestModel requestModel;
  final Function(AddNewSiteRequestModel) updateRequestModel;

  const AddSitePhotos({super.key, required this.index, required this.requestModel, required this.updateRequestModel});

  @override
  _AddSitePhotosState createState() => _AddSitePhotosState();
}

class _AddSitePhotosState extends State<AddSitePhotos> with AutomaticKeepAliveClientMixin {
  final List<File> _selectedMedia = []; // Danh sách file media đã chọn
  final List<String> _mediaTypes = []; // Loại media: 'image' hoặc 'video'
  final List<Media> _medias = [];
  final logger = LogService().logger;
  Completer<void>? _dialogCompleter;

  // Chọn ảnh từ thư viện
  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isNotEmpty) {
      setState(() {
        _selectedMedia.addAll(images.map((e) => File(e.path)));
        _mediaTypes.addAll(List.generate(images.length, (_) => 'image'));
        logger.i(images.map((e) => e.path));
      });
    }
  }

  // Chọn hoặc quay video
  Future<void> _pickVideo(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? video = await picker.pickVideo(
      source: source,
      maxDuration: const Duration(seconds: 60), // Optional: Giới hạn thời gian video
    );

    if (video != null) {
      setState(() {
        _selectedMedia.add(File(video.path));
        _mediaTypes.add('video');
        logger.i(video.path);
      });
    }
  }

  // Xóa media khỏi danh sách
  void _removeMedia(int index) {
    setState(() {
      _selectedMedia.removeAt(index);
      _mediaTypes.removeAt(index);
    });
  }

  // Gửi media tới API
  Future<void> _submitMedia() async {
    final List<Map<String, String>> mediaData = List.generate(
      _selectedMedia.length,
      (index) => {
        'path': _selectedMedia[index].path,
        'type': _mediaTypes[index],
      },
    );

    final UploadFileRequestModel request = UploadFileRequestModel(
      files: _selectedMedia.map((e) => e.path).toList(),
    );

    final mediaBloc = BlocProvider.of<MediaBloc>(context);
    mediaBloc.add(UploadMedia(request));

    // Thực hiện gửi mediaData tới API hoặc xử lý thêm
    logger.i(request.toJson());
  }

  // Hiển thị menu chọn nguồn video (Thư viện hoặc Camera)
  Future<void> _showVideoSourceSelector() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Chọn từ thư viện'),
              onTap: () async {
                Navigator.pop(context);
                await _pickVideo(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Quay video'),
              onTap: () async {
                Navigator.pop(context);
                await _pickVideo(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    deactivate();    
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<MediaBloc, MediaState>(
      listener: (context, state) async {
        if (_dialogCompleter != null && !_dialogCompleter!.isCompleted) {
          Navigator.of(context).pop();
          await _dialogCompleter!.future;
        }

        if (state is UploadMediaSuccess && state.isRecentlyUploadMedia == true) {
          state.isRecentlyUploadMedia = false;
          for (var media in state.medias) {
            _medias.add(Media.defaultInstance.copyWith(
              id: media.idStr,
              url: media.url,
            ));
          }
          
          widget.requestModel.copyWith(
            medias: _medias,
            requestModel: widget.requestModel,
          );

          logger.i(widget.requestModel.toJson());

          widget.updateRequestModel(widget.requestModel);

          _showCustomPopup(
            title: 'Thêm ảnh/video',
            content: 'Thêm ảnh/video vào địa điểm thành công, hãy tiếp tục hoàn thành các bước khác',
          );
        } else if (state is UploadMediaFailed) {
          logger.e('Fail to upload, message: ${state.message}');
          _showCustomPopup(
            title: 'Thêm ảnh/video',
            content: 'Thêm ảnh/video vào địa điểm thất bại, vui lòng thử lại sau',
          );
        } else if (state is UploadingMedia) {
          _dialogCompleter = Completer<void>();
          _showCustomPopup(
            title: 'Đang tải lên ảnh/video',
            content: 'Vui lòng đợi trong giây lát...',
            showAction: false,
          ).then((_) {
            _dialogCompleter?.complete();
          });
        }
      },
      child: _buildContent(),
    );
  }

  Future<void> _showCustomPopup({required String title, required String content, bool showAction = true}) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return CustomPopup(
          title: title,
          content: content,
          confirmText: 'OK',
          onConfirm: () {
            Navigator.of(context).pop();
          },
          showAction: showAction,
        );
      },
    );
  }

  Scaffold _buildContent() {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thêm ảnh hoặc video về địa điểm của bạn',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _pickImages,
                  icon: const Icon(Icons.image),
                  label: const Text('Chọn ảnh'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _showVideoSourceSelector,
                  icon: const Icon(Icons.videocam),
                  label: const Text('Thêm video'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _selectedMedia.length,
              itemBuilder: (context, index) {
                return buildMediaCard(index);
              },
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _submitMedia,
                child: const Text('Tải lên ảnh/video'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tạo thẻ hiển thị media (ảnh hoặc video)
  Widget buildMediaCard(int index) {
    final isVideo = _mediaTypes[index] == 'video';
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: isVideo
              ? SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: VideoCard(videoUrl: _selectedMedia[index].path),
                )
              : Image.file(
                  _selectedMedia[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.5),
            ),
            child: IconButton(
              onPressed: () => _removeMedia(index),
              icon: const Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}