import 'package:flutter/material.dart';
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
    const Center(
      child: Text('Account'),
    )
  ];

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          // borderRadius: BorderRadius.circular(5),
        ),
        child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: navigateBottomBar,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.amberAccent.shade200,
            unselectedItemColor: Colors.white,
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
                  Icons.explore,
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
                  Icons.settings,
                ),
                label: 'Account',
              ),
            ]),
      ),
    );
  }
}
