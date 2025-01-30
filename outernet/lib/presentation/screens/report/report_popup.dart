import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/models/report/report_request_model.dart';
import 'package:outernet/presentation/blocs/report_bloc/report_bloc.dart';
import 'package:outernet/presentation/blocs/report_bloc/report_events.dart';
import 'package:outernet/presentation/blocs/report_bloc/report_state.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';

enum ReportType { user, siteReview, site }

class ReportDialog extends StatefulWidget {
  final ReportType type;
  final int? userId;
  final int? siteId;
  final int? reviewId;

  const ReportDialog({super.key, required this.type, this.userId, this.siteId, this.reviewId});

  @override
  _ReportDialogState createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  String? selectedOption;
  int? categoryId;
  final TextEditingController detailsController = TextEditingController();

  void _submitReport(BuildContext context) {
    if (selectedOption == null || selectedOption!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn một lý do báo cáo')),
      );
      return;
    }

    final type = _getTitle();
    final reportBloc = context.read<ReportBloc>();

    switch (type) {
      case 'Báo cáo người dùng này':
        reportBloc.add(ReportUser(UserReportRequestModel(userId: widget.userId, categoryId: categoryId!, description: detailsController.text)));
        break;
      case 'Báo cáo đánh giá của người dùng này':
        reportBloc.add(ReportSiteReview(SiteReviewReportRequestModel(siteReviewId: widget.reviewId, categoryId: categoryId)));
        break;
      case 'Báo cáo địa điểm này':
      default:
        reportBloc.add(ReportSite(SiteReportRequestModel(siteId: widget.siteId, categoryId: categoryId!, description: detailsController.text)));
        break;
    }
  }

  String _getTitle() {
    switch (widget.type) {
      case ReportType.user:
        return 'Báo cáo người dùng này';
      case ReportType.siteReview:
        return 'Báo cáo đánh giá của người dùng này';
      case ReportType.site:
      default:
        return 'Báo cáo địa điểm này';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        try {
          switch (widget.type) {
          case ReportType.user:
            return context.read<ReportBloc>()..add(LoadUserReportCategories());
          case ReportType.siteReview:
            return context.read<ReportBloc>()..add(LoadSiteReviewReportCategories());
          case ReportType.site:
          default:
            return context.read<ReportBloc>()..add(LoadSiteReportCategories());
          }
        } catch (e) {
          switch (widget.type) {
          case ReportType.user:
            return sl<ReportBloc>()..add(LoadUserReportCategories());
          case ReportType.siteReview:
            return sl<ReportBloc>()..add(LoadSiteReviewReportCategories());
          case ReportType.site:
          default:
            return sl<ReportBloc>()..add(LoadSiteReportCategories());
          }
        }
      },
      child: Builder(
        builder: (context) {
          return _buildContent();
        }
      ),
    );
  }

  BlocConsumer<ReportBloc, ReportState> _buildContent() {
  return BlocConsumer<ReportBloc, ReportState>(
    listener: (context, state) {
      if (state is ReportSuccess) {
        showDialog(
          context: context,
          builder: (context) {
            return CustomPopup(
              title: 'Báo cáo nội dung',
              content: 'Bạn đã báo cáo nội dung này thành công. Cảm ơn bạn đã giúp đỡ!',
              confirmText: 'Ok',
              onConfirm: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            );
          },
        );
      } else if (state is ReportFailed) {
        showDialog(
          context: context,
          builder: (context) {
            return CustomPopup(
              title: 'Báo cáo nội dung',
              content: 'Có lỗi xảy ra khi báo cáo nội dung này. Vui lòng thử lại sau! Mã lỗi: ${state.error}',
              confirmText: 'Ok',
              onConfirm: () {
                Navigator.of(context).pop();
              },
            );
          },
        );
      } else if (state is LoadCategoriesFailed) {
        showDialog(
          context: context,
          builder: (context) {
            return CustomPopup(
              title: 'Báo cáo nội dung',
              content: 'Có lỗi xảy ra khi tải danh sách lý do báo cáo. Vui lòng thử lại sau!',
              confirmText: 'Ok',
              onConfirm: () {
                Navigator.of(context).pop();
              },
            );
          },
        );
      }
    },
    builder: (context, state) {
      if (state is LoadReportCategoriesSuccess) {
        return AlertDialog(
          title: Text(_getTitle()),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.9,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bạn có chắc chắn muốn báo cáo?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: state.reports.categories!.map((category) {
                      final option = category.name;
                      return RadioListTile<String>(
                        value: option ?? '',
                        groupValue: selectedOption,
                        title: Text(option ?? ''),
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                            categoryId = category.id;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Vui lòng cung cấp chi tiết:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: detailsController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nhập chi tiết tại đây...',
                    ),
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Hủy'),
            ),
            FilledButton(
              onPressed: () => _submitReport(context),
              child: const Text('Báo cáo'),
            ),
          ],
        );
      } else if (state is Loading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return const Center(child: Text('Không thể tải các tùy chọn báo cáo'));
      }
    },
  );
}

}