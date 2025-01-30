// simple homepage screen

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/data/data_sources/local_datasouces/secure_storage.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_bloc.dart';
import 'package:outernet/presentation/screens/home_screen/home_screen.dart';
import 'package:outernet/presentation/screens/notifications/noti_service.dart';
import 'package:outernet/presentation/screens/notifications/notification_page.dart';
import 'package:outernet/presentation/screens/personal_screen/infomation_magager_screen.dart';
import 'package:outernet/presentation/screens/planning/plan_setup_screen.dart';
import 'package:outernet/presentation/screens/site_screen/search_site/search_site.dart';
import 'package:outernet/presentation/themes.dart';

class PageSelector extends StatefulWidget {
  final int? userId;
  final String? token;

  const PageSelector({super.key, this.userId, this.token});

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  int selectedIndex = 0;
  String token = '';
  late WebSocketService webSocketService;

  @override
  void initState() {
    super.initState();
    _invokeNotificationService(1);
    webSocketService = WebSocketService(jwtToken: widget.token!, userId: widget.userId!);
  }

  @override
  Widget build(BuildContext context) {
    // final webSocketManager = Provider.of<WebSocketManager>(context);
    TextStyle pageIndexStyle = AppTextStyles.body1Semibold.copyWith(color: Colors.black87, fontSize: 14);

    final userBloc = BlocProvider.of<UserBloc>(context);
    // webSocketManager.initialize(widget.token!, (userBloc.state as UserLogedIn).user.id!);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: selectedIndex,
        showElevation: true,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FlashyTabBarItem(
            icon: const Icon(
              Iconsax.home,
              color: Colors.black87,
              size: 24,
            ),
            title: Text(
              'Khám phá',
              style: pageIndexStyle,
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Iconsax.search_favorite,
              color: Colors.black87,
              size: 24,
            ),
            title: Text(
              'Tìm kiếm',
              style: pageIndexStyle,
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Iconsax.note,
              color: Colors.black87,
              size: 24,
            ),
            title: Text(
              'Kế hoạch',
              style: pageIndexStyle,
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Iconsax.notification,
              color: Colors.black87,
              size: 24,
            ),
            title: Text(
              'Thông báo',
              style: pageIndexStyle,
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Iconsax.personalcard,
              color: Colors.black87,
              size: 24,
            ),
            title: Text(
              'Cá nhân',
              style: pageIndexStyle,
            ),
          ),
        ],
      ),
      body: <Widget>[
          const HomeScreen(),
          SearchLocationPage(),
          const PlanSetupScreen(),
          NotificationPage(webSocketService: webSocketService),
        const InformationManagerScreen(),
      ][selectedIndex],
    );
  }

  void _invokeNotificationService(int id) async {
    token = await SecureStorage.getToken();
  }
}