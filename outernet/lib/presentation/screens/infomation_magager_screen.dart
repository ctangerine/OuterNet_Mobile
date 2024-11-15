import 'package:flutter/material.dart';
import 'package:outernet/presentation/screens/notifications_screen.dart';
import 'package:outernet/presentation/screens/security_screen.dart';
import 'package:outernet/presentation/widgets/button_custom.dart';

class InformationManagerScreen extends StatelessWidget {
  const InformationManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonIcon(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 20),
              _buildOptionMenu(context),
              const SizedBox(height: 20),
              _buildLogoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Thông tin',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.face,
          size: 30,
        ),
      ],
    );
  }

  Widget _buildOptionMenu(BuildContext context) {
    return Column(
      children: [
        _buildOptionItem(context,'Thông tin tài khoản', Icons.person, null),
        _buildOptionItem(context, 'Mật khẩu và bảo mật', Icons.shield, const SecurityScreen()),
        const Divider(),
        _buildOptionItem(context, 'Bài đánh giá', Icons.edit, null),
        _buildOptionItem(context, 'Địa điểm đã đăng', Icons.map, null),
        _buildOptionItem(context, 'Báo cáo đã gửi', Icons.report, null),
        _buildOptionItem(context, 'Thông báo của tôi', Icons.notifications, const NotificationsScreen()),
        const Divider(),
        _buildOptionItem(context, 'Chuyển tài khoản', Icons.swap_horizontal_circle, null),
        _buildOptionItem(context, 'Đăng xuất', Icons.logout, null),
      ],
    );
  }

  Widget _buildOptionItem(BuildContext context, title, IconData icon, Widget? screen) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(title),
      // on tap, navigate to the notificiations screen
      onTap: () {
        // navigate to the notifications screen
        if (screen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
        else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotificationsScreen()),
          ); // do nothing
        }
      },
    );
  }

  Widget _buildLogoutButton() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButtonCustom(
            text: 'Đăng xuất',
            onPressed: () => null,
          ),
        ),
      ],
    );
  }
}