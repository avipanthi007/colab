import 'package:colab/core/theme/colors.dart';
import 'package:colab/src/controllers/permits_controller.dart';
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
  @override
  void initState() {
    super.initState();
    permitController.fetchPermitData();
    permitController.approversData();
    permitController.contractorsData();
    permitController.laboursData();
    permitController.getLocation();
  }

  final permitController = Get.find<PermitsController>();
  RxInt selectedIndex = 0.obs;

  static List<Widget> widgetOptions = <Widget>[
    DashboardPage(),
    MyTask(),
    MyTools(),
    Profile(),
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
          body: widgetOptions.elementAt(selectedIndex.value),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryBlack,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              buildNavItem(Icons.home, 0),
              buildNavItem(Icons.pending_actions_rounded, 1),
              buildNavItem(Icons.info_rounded, 2),
              buildNavItem(Icons.account_circle_sharp, 3),
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

  BottomNavigationBarItem buildNavItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: selectedIndex.value == index
          ? CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primaryYellow,
              child: Icon(
                icon,
                color: AppColors.white,
                size: 25,
              ),
            )
          : Icon(icon, color: Colors.grey),
      label: '',
    );
  }
}
