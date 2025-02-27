import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelo/features/account/screens/profile_screen.dart';
import 'package:travelo/features/account/widgets/custom_list_tile.dart';
import 'package:travelo/features/auth/services/auth_services.dart';
import 'package:travelo/globals/themer/theme_manager.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings-screen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthServices>().user;

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
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProfilePage.routeName,
                        arguments: {});
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      user.photoURL!,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${user.displayName}',
                  style: const TextStyle(
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
                title: 'My Travel History',
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
                onTap: () {
                  context.read<AuthServices>().signOut(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
