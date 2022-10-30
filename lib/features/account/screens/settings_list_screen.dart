import 'package:flutter/material.dart';
import 'package:travelo/features/account/widgets/custom_list_tile.dart';
import 'package:travelo/globals/themer/theme_manager.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings-screen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier = ThemeNotifier();
    // final theme = themeNotifier.getTheme();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // user profile
          Center(
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/13600148/pexels-photo-13600148.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Sam Rasugu',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              color: Colors.black12,
              height: 1,
            ),
          ),
          Column(
            children: [
              CustomListTile(
                leadingicon: Icons.travel_explore,
                trailingicon: Icons.arrow_forward_ios_rounded,
                title: 'My Ride History',
                onTap: () {},
              ),
              CustomListTile(
                leadingicon: Icons.discount,
                trailingicon: Icons.arrow_forward_ios_rounded,
                title: 'Discounts',
                onTap: () {},
              ),
              CustomListTile(
                leadingicon: Icons.security_rounded,
                trailingicon: Icons.arrow_forward_ios_rounded,
                title: 'Security Settings',
                onTap: () {},
              ),
              CustomListTile(
                leadingicon: Icons.brightness_high,
                trailingicon: Icons.toggle_on,
                title: 'Theme',
                onTap: () {
                  // themeNotifier.setDarkMode();
                },
              ),
              CustomListTile(
                leadingicon: Icons.help_outline_rounded,
                trailingicon: Icons.arrow_forward_ios_rounded,
                title: 'Help',
                onTap: () {},
              ),
              CustomListTile(
                leadingicon: Icons.logout_rounded,
                trailingicon: Icons.arrow_forward_ios_rounded,
                title: 'LogOut',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
