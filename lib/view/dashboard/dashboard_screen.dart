import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/controller/screen_controller/home/home_controller.dart';
import 'package:pet_app/view/history/adoption_history_screen.dart';
import 'package:pet_app/view/home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  HomeController homeCtrl = Get.put(HomeController());

  final pages = [
    HomeScreen(),
    AdoptionHistoryScreen(),
  ];
  int selectedIndex = 0;

  @override
  void dispose() {
    homeCtrl.pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
