import 'package:flutter/material.dart';
import 'package:travelo/features/account/screens/settings_list_screen.dart';
import 'package:travelo/features/explore/screens/explore_screen.dart';
import 'package:travelo/features/home/home_screen.dart';
import 'package:travelo/features/places/screens/place_details_screen.dart';
import 'package:travelo/main_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
     case MainPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MainPage(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case PlaceDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PlaceDetailsScreen(),
      );
    case ExploreScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ExploreScreen(),
      );
    case SettingsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SettingsScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Oops!!!Page does not exist'),
          ),
        ),
      );
  }
}
