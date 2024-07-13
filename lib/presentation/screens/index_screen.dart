import 'package:ecom_ui/presentation/screens/home_screen.dart';
import 'package:ecom_ui/presentation/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int currentIndex = 0;
  List<Widget> bottomNavigationScreens = [];

  @override
  void initState() {
    super.initState();
    bottomNavigationScreens = [
      const HomeScreen(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavigationScreens[currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(indicatorColor: Colors.blue.shade100),
        child: NavigationBar(
          height: 60,
          onDestinationSelected: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(seconds: 3),
          selectedIndex: currentIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
              selectedIcon: Icon(Icons.person),
            ),

            // NavigationDestination(
            //   icon: Icon(Icons.settings),
            //   label: 'Settings',
            // ),

            // NavigationDestination(
            //   icon: Icon(Icons.logout_outlined),
            //   label: 'Logout',
            // ),
          ],
        ),
      ),
    );
  }
}
