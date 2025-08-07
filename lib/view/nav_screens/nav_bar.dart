import 'package:flutter/material.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/nav_screens/contact_us.dart';
import 'package:par_1/view/nav_screens/discover.dart';
import 'package:par_1/view/nav_screens/home/homepage.dart';
import 'package:par_1/view/nav_screens/services/our_services.dart';
import 'package:par_1/view/nav_screens/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Homepage(),
    Discover(),
    OurServices(),
    ContactUs(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFD4AF37),
        child: SizedBox(
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/home.png',
                  height: 22,
                  width: 22,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/dis.png',
                  height: 22,
                  width: 22,
                ),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/service.png', color: white),
                label: 'Services',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.phone_enabled, size: 22),
                label: 'Contact Us',
              ),

              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/profile.png',
                  height: 22,
                  width: 22,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
