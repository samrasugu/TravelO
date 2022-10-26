import 'package:flutter/material.dart';
import 'package:travelo/features/account/screens/settings_list_screen.dart';
import 'package:travelo/features/home/home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List pages = [
    const HomeScreen(),
    const Center(
      child: Text('Explore'),
    ),
    const Center(
      child: Text('Favorites'),
    ),
    const SettingsScreen()
  ];

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: navigateBottomBar,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.amberAccent.shade200,
              unselectedItemColor: Colors.grey,
              elevation: 1,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.explore_outlined,
                  ),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border_rounded,
                  ),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_rounded,
                  ),
                  label: 'Account',
                ),
              ]),
        ),
      ),
    );
  }
}
