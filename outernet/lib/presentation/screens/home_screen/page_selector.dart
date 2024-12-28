// simple homepage screen

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/presentation/screens/home_screen/home_screen.dart';
import 'package:outernet/presentation/screens/personal_screen/infomation_magager_screen.dart';
import 'package:outernet/presentation/screens/planning/plan_setup_screen.dart';
import 'package:outernet/presentation/themes.dart';

class PageSelector extends StatefulWidget {
  const PageSelector({super.key});

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  int selectedIndex = 4;
  @override
  Widget build(BuildContext context) {
    TextStyle pageIndexStyle = AppTextStyles.body1Semibold.copyWith(color: Colors.black87, fontSize: 14);
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
        // sample homepage, sameple search page, sample plan page, sample notification page, InformationManagerScreen
          //Container(color: Colors.red, child: const Center(child: Text('Khám phá', style: TextStyle(fontSize: 24)))),
          const HomeScreen(),
          Container(color: Colors.green, child: const Center(child: Text('Tìm kiếm', style: TextStyle(fontSize: 24)))),
          const PlanSetupScreen(),
          Container(color: Colors.yellow, child: const Center(child: Text('Thông báo', style: TextStyle(fontSize: 24)))),
          const InformationManagerScreen(),
      ][selectedIndex],
    );
  }
}