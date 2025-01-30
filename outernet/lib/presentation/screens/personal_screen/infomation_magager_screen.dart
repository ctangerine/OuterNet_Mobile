import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/presentation/screens/personal_screen/notifications_screen.dart';
import 'package:outernet/presentation/screens/personal_screen/security_screen.dart';
import 'package:outernet/presentation/screens/site_screen/site_review/get_my_reviews.dart';
import 'package:outernet/presentation/screens/site_screen/site_status/site_status.dart';
import 'package:outernet/presentation/themes.dart';

class InformationManagerScreen extends StatelessWidget {
  const InformationManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 20),
              _buildOptionMenu(context),
              const Spacer(),
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
          'Thông tin cá nhân',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionMenu(BuildContext context) {
    return Column(
      children: [
        _buildOptionItem(context, 'Thông tin tài khoản', Iconsax.profile_circle, null),
        _buildOptionItem(context, 'Mật khẩu và bảo mật', Iconsax.shield_tick, const SecurityScreen()),
        const Divider(),
        _buildOptionItem(context, 'Bài đánh giá', Iconsax.edit, MyReviewPage()),
        _buildOptionItem(context, 'Địa điểm đã đăng', Iconsax.map, PublishedSitesPage()),
        _buildOptionItem(context, 'Báo cáo đã gửi', Iconsax.warning_2, null),
        _buildOptionItem(context, 'Thông báo của tôi', Iconsax.notification, const NotificationsScreen()),
        const Divider(),
        _buildOptionItem(context, 'Chuyển tài khoản', Iconsax.user_tag, null),
        _buildOptionItem(context, 'Đăng xuất', Iconsax.logout, null),
      ],
    );
  }

  Widget _buildOptionItem(BuildContext context, String title, IconData icon, Widget? screen) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(title),
      onTap: () {
        if (screen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
      },
    );
  }

  Widget _buildLogoutButton() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: FilledButton(
              onPressed: () {},
              child: const Text('Đăng xuất', style: AppTextStyles.body1Semibold,),
            ),
          ),
        ),
      ],
    );
  }
}