import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:outernet/data/models/medias/media_request_model.dart';
import 'package:outernet/data/models/site_review/site_review_request_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/presentation/blocs/media_bloc/media_bloc.dart';
import 'package:outernet/presentation/blocs/media_bloc/media_events.dart';
import 'package:outernet/presentation/blocs/media_bloc/media_state.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';
import 'package:outernet/presentation/blocs/site_review_bloc/site_review_bloc.dart';
import 'package:outernet/presentation/blocs/site_review_bloc/site_review_event.dart';
import 'package:outernet/presentation/blocs/site_review_bloc/site_review_state.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'dart:io';

import 'package:outernet/presentation/ui_component_resused/video_player.dart';

class AddReviewPage extends StatefulWidget {
  const AddReviewPage({super.key});

  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  final TextEditingController _reviewController = TextEditingController();
  final List<File> _selectedMedia = [];
  final List<String> _mediaTypes = [];
  final List<Media> _medias = [];
  int _selectedStar = 0;
  DateTime? _selectedDate;
  Completer<void>? _dialogCompleter;

  // Hàm chọn ảnh từ thư viện
  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isNotEmpty) {
      setState(() {
        _selectedMedia.addAll(images.map((e) => File(e.path)));
        _mediaTypes.addAll(List.generate(images.length, (_) => 'image'));
      });
    }
  }

  // Hàm chọn hoặc quay video
  Future<void> _pickVideo(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? video = await picker.pickVideo(
      source: source,
      maxDuration: const Duration(seconds: 60),
    );

    if (video != null) {
      setState(() {
        _selectedMedia.add(File(video.path));
        _mediaTypes.add('video');
      });
    }
  }

  // Hàm xóa media khỏi danh sách
  void _removeMedia(int index) {
    setState(() {
      _selectedMedia.removeAt(index);
      _mediaTypes.removeAt(index);
    });
  }

  void _onStarTap(int star) {
    setState(() {
      _selectedStar = star;
    });
  }

  Widget _buildStar(int star) {
    return GestureDetector(
      onTap: () => _onStarTap(star),
      child: Icon(
        Icons.star_rate_rounded,
        color: star <= _selectedStar ? Colors.yellow : Colors.grey,
        size: 32,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MediaBloc>(
          create: (context) {
            try {
              return context.read<MediaBloc>();
            } catch (e) {
              return sl<MediaBloc>();
            }
          },
        ),
        BlocProvider<SiteBloc>(
          create: (context) {
            try {
              return context.read<SiteBloc>();
            } catch (e) {
              _showCustomPopup(title: 'Thêm đánh giá', content: 'Không thể lấy thông tin chi tiết địa điểm, thử lại sau');
              return sl<SiteBloc>();
            }
          },
        ),
        BlocProvider<SiteReviewBloc>(
          create: (context) {
            try {
              return context.read<SiteReviewBloc>(); 
            } catch (e) {
              return sl<SiteReviewBloc>();
            }
          },
        )
      ],
      child: Builder(builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<MediaBloc, MediaState>(
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

                  final siteBloc = BlocProvider.of<SiteBloc>(context);
                  final reviewBloc = BlocProvider.of<SiteReviewBloc>(context);
            
                  final ReviewSiteRequestModel request = ReviewSiteRequestModel(
                    siteId: (siteBloc.state as LoadListSiteSuccess).siteDetail.siteId!,
                    comment: _reviewController.text,
                    generalRating: double.parse(_selectedStar.toString()),
                    arrivalDate: _selectedDate,
                    medias: _medias,
                  );
                  
                  reviewBloc.add(AddReview(request));
                } else if (state is UploadMediaFailed) {
                  _showCustomPopup(
                    title: 'Thêm ảnh/video',
                    content:
                      'Thêm ảnh/video vào địa điểm thất bại, vui lòng thử lại sau',
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
            ),
            BlocListener<SiteReviewBloc, SiteReviewState>(
              listener: (context, state) {
                if (state is SiteReviewFetchSuccess) {
                  if (state.isRecentlyAddReview == true) {
                    _showCustomPopup(
                      title: 'Thêm đánh giá',
                      content: 'Thêm đánh giá địa điểm thành công',
                    );
                  }
                  else if (state.error!= null && state.error!.isNotEmpty) {
                    _showCustomPopup(
                      title: 'Thêm đánh giá',
                      content: 'Thêm đánh giá địa điểm thất bại. ${state.error}',
                    );
                  }
                }
              },
            )
          ],
          child: _buildContent(context),
        );
      }),
    );
  }

  Scaffold _buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm đánh giá'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tiêu đề địa điểm
            const Text(
              'Cảm nhận của bạn về địa điểm này',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Đánh giá sao
            const Text(
              'Bạn đánh giá trải nghiệm của mình bao nhiêu sao?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) => _buildStar(index + 1)),
            ),
            const SizedBox(height: 16),
            // Ngày đánh giá
            const Text(
              'Bạn đến đây vào khoảng thời gian nào?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: _selectedDate == null
                    ? 'Chọn ngày'
                    : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Iconsax.calendar),
              ),
              readOnly: true,
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            // Viết đánh giá
            const Text(
              'Viết đánh giá',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Nhập đánh giá của bạn...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Thêm ảnh/video
            const Text(
              'Thêm ảnh/video vào đánh giá',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton.icon(
                  onPressed: _pickImages,
                  icon: const Icon(Iconsax.add_square),
                  label: const Text('Chọn ảnh từ thư viện'),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () => _pickVideo(ImageSource.gallery),
                  icon: const Icon(Iconsax.video_play),
                  label: const Text('Chọn video từ thư viện'),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () => _pickVideo(ImageSource.camera),
                  icon: const Icon(Iconsax.video),
                  label: const Text('Quay video'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Hiển thị danh sách media
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
                final isVideo = _mediaTypes[index] == 'video';
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: isVideo
                          ? SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: VideoCard(
                                  videoUrl: _selectedMedia[index].path),
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
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
            // Nút cập nhật đánh giá
            Center(
              child: FilledButton(
                onPressed: () {
                  final mediaBloc = BlocProvider.of<MediaBloc>(context);
                  final UploadFileRequestModel request = UploadFileRequestModel(
                    files: _selectedMedia.map((e) => e.path).toList(),
                  );
                  mediaBloc.add(UploadMedia(request));
                },
                child: const Text('Thêm đánh giá'),
              ),
            ),
          ],
        ),
      ),
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
}
