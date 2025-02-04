import 'package:colab/core/theme/colors.dart';
import 'package:colab/src/views/screens/dashboard/dashboard_page.dart';
import 'package:colab/src/views/screens/dashboard/my_task.dart';
import 'package:colab/src/views/screens/dashboard/my_tools.dart';
import 'package:colab/src/views/screens/dashboard/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBottomNavigationbar extends StatefulWidget {
  const HomeBottomNavigationbar({super.key});

  @override
  State<HomeBottomNavigationbar> createState() =>
      _HomeBottomNavigationbarState();
}

class _HomeBottomNavigationbarState extends State<HomeBottomNavigationbar> {
  RxInt selectedIndex = 0.obs;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    MyTask(),
    MyTools(),
    Profile(),
    MyTask(),
  ];

  void _onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Obx(
        () => Scaffold(
          body: _widgetOptions.elementAt(selectedIndex.value),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.pending_actions_rounded, 1),
              _buildNavItem(Icons.add_circle_outline, 2),
              _buildNavItem(Icons.info_rounded, 3),
              _buildNavItem(Icons.account_circle_sharp, 4),
            ],
            currentIndex: selectedIndex.value,
            onTap: _onItemTapped,
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            selectedItemColor: AppColors.primaryYellow,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: selectedIndex.value == index
          ? CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.primaryYellow,
              child: Icon(
                icon,
                color: AppColors.white,
                size: 35,
              ),
            )
          : Icon(icon, color: Colors.grey),
      label: '',
    );
  }
}
