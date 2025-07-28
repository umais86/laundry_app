import 'package:flutter/material.dart';
import 'package:par_1/view/discover.dart';
import 'package:par_1/view/homepage.dart';
import 'package:par_1/view/profile.dart';
import 'package:par_1/view/support.dart';

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
    Support(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 42,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(193, 0, 0, 0),
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(Icons.add, size: 28, color: Colors.white),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: -4,
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
                icon: Image.asset(
                  'assets/icons/msg.png',
                  height: 22,
                  width: 22,
                ),
                label: 'Support',
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
