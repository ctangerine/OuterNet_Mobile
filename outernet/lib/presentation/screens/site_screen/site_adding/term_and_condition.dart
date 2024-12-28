import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';

class TermAndCondition extends StatefulWidget {
  final int index;
  final AddNewSiteRequestModel requestModel;
  final Function(AddNewSiteRequestModel) updateRequestModel;
  
  const TermAndCondition({super.key, required this.index, required this.requestModel, required this.updateRequestModel});

  @override
  State<TermAndCondition> createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<SiteBloc, SiteState>(
      listener: (context, state) {
        if (state is LoadListSiteSuccess && state.isNewlyAddedSite == true) {
          showDialog(context: context, builder: (context) {
            String title = 'Thêm mới địa điểm';
            String content = 'Thêm địa điểm thành công, vui lòng chờ xét duyệt từ phía quản trị viên. Cảm ơn sự đóng góp của bạn';
            String confirmText = 'OK';
            onConfirm() {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }
            return CustomPopup(title: title, content: content, confirmText: confirmText, onConfirm: onConfirm);
          });
        }
        if (state is LoadListSiteSuccess && (state.message != null || state.message!.isNotEmpty) && state.isNewlyAddedSite == false) {
          showDialog(context: context, builder: (context) {
            String title = 'Thêm mới địa điểm';
            String content = 'Thêm địa điểm thất bại. ${state.message}';
            String confirmText = 'OK';
            onConfirm() {
              Navigator.of(context).pop();
              
            }
            return CustomPopup(title: title, content: content, confirmText: confirmText, onConfirm: onConfirm);
          });
        }
      },
      child: _buildContent(context),
    );
  }

  Scaffold _buildContent(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Xác nhận điều khoản đăng địa điểm',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Bằng việc xác nhận, bạn đã đồng ý với các điều khoản và quy định của chúng tôi.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'ĐIỀU KHOẢN VÀ QUY ĐỊNH VỀ VIỆC ĐĂNG ĐỊA ĐIỂM TRÊN TRAVEL BUDDY',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          buildSectionTitle('1. Phạm vi áp dụng'),
          buildSectionContent(
              'Điều khoản này áp dụng cho tất cả cá nhân, tổ chức muốn đăng địa điểm tham quan, du lịch khám phá hoặc địa điểm kinh doanh như nhà hàng, khách sạn, resort trên nền tảng Travel Buddy.'),
          buildSectionTitle('2. Điều kiện đăng địa điểm'),
          buildSubSectionTitle('2.1. Tính chính xác và minh bạch:'),
          buildSectionContent(
              '- Địa điểm phải cung cấp thông tin chính xác, đầy đủ và minh bạch.\n- Hình ảnh phải rõ ràng, không vi phạm bản quyền.'),
          buildSubSectionTitle('2.2. Tính hợp pháp:'),
          buildSectionContent(
              '- Địa điểm phải tuân thủ các quy định pháp luật hiện hành.\n- Không đăng địa điểm có hoạt động bất hợp pháp, không lành mạnh.'),
          buildSubSectionTitle('2.3. Quyền sở hữu và ủy quyền:'),
          buildSectionContent(
              '- Người đăng phải là chủ sở hữu hoặc có sự ủy quyền hợp lệ từ chủ sở hữu.'),
          buildSectionTitle('3. Nội dung địa điểm đăng tải'),
          buildSubSectionTitle('3.1. Mô tả địa điểm:'),
          buildSectionContent(
              '- Cung cấp mô tả chi tiết về dịch vụ, tiện ích, giờ hoạt động, địa chỉ và thông tin liên hệ.'),
          buildSubSectionTitle('3.2. Hình ảnh và video:'),
          buildSectionContent(
              '- Hình ảnh và video phải thể hiện đúng thực tế.\n- Không chứa nội dung phản cảm, bạo lực, kích động hay vi phạm thuần phong mỹ tục.'),
          buildSubSectionTitle('3.3. Giá cả và ưu đãi:'),
          buildSectionContent(
              '- Nếu có thông tin về giá cả, khuyến mãi, phải cập nhật chính xác và kịp thời.'),
          buildSectionTitle('4. Trách nhiệm của người đăng'),
          buildSectionContent(
              '- Chịu trách nhiệm hoàn toàn về tính chính xác và hợp pháp của thông tin đăng tải.\n- Đồng ý cho nền tảng sử dụng thông tin và hình ảnh để quảng bá.'),
          buildSectionTitle('5. Quyền của nền tảng'),
          buildSectionContent(
              '- Có quyền từ chối, chỉnh sửa hoặc xóa bỏ thông tin nếu phát hiện vi phạm các điều khoản.\n- Không chịu trách nhiệm pháp lý liên quan đến nội dung do người dùng đăng tải.'),
          buildSectionTitle('6. Quy định về xử lý vi phạm'),
          buildSectionContent(
              '- Cảnh cáo hoặc khóa tài khoản nếu người đăng vi phạm điều khoản.\n- Thông báo cơ quan chức năng nếu có hành vi vi phạm pháp luật nghiêm trọng.'),
          buildSectionTitle('7. Điều khoản bổ sung'),
          buildSectionContent(
              '- Nền tảng có quyền thay đổi điều khoản bất kỳ lúc nào mà không cần báo trước.\n- Người đăng có trách nhiệm cập nhật các thay đổi và tuân thủ các điều khoản mới.\n- Bằng việc đăng địa điểm, người dùng đồng ý tuân thủ đầy đủ các điều khoản và quy định này.'),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                logger.d('requestModel: ${widget.requestModel}');
                BlocProvider.of<SiteBloc>(context).add(AddSite(widget.requestModel));
              },
              child: const Text('Đồng ý và tiếp tục'),
            ),
          ),
        ],
      ),
    ),
  );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildSubSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 15,
        height: 1.5,
      ),
    );
  }
}
