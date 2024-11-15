// simple homepage screen

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:outernet/presentation/screens/personal_screen/infomation_magager_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int selectedIndex = 4;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            FlashyTabBarItem(icon: const Icon(Icons.home), title: const Text('Khám phá')),
            FlashyTabBarItem(icon: const Icon(Icons.search), title: const Text('Tìm kiếm')),
            FlashyTabBarItem(icon: const Icon(Icons.note), title: const Text('Lên kế hoạch')),
            FlashyTabBarItem(icon: const Icon(Icons.notifications), title: const Text('Thông báo')),
            FlashyTabBarItem(icon: const Icon(Icons.person), title: const Text('Cá nhân')),
          ],
        ),
        body: <Widget>[
          // sample homepage, sameple search page, sample plan page, sample notification page, InformationManagerScreen
            Container(color: Colors.red, child: const Center(child: Text('Khám phá', style: TextStyle(fontSize: 24)))),
            Container(color: Colors.green, child: const Center(child: Text('Tìm kiếm', style: TextStyle(fontSize: 24)))),
            Container(color: Colors.blue, child: const Center(child: Text('Lên kế hoạch', style: TextStyle(fontSize: 24)))),
            Container(color: Colors.yellow, child: const Center(child: Text('Thông báo', style: TextStyle(fontSize: 24)))),
          const InformationManagerScreen(),
        ][selectedIndex],
      ),
    );
  }
}