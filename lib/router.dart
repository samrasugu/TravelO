import 'package:flutter/material.dart';
import 'package:travelo/features/account/screens/profile_screen.dart';
import 'package:travelo/features/account/screens/settings_list_screen.dart';
import 'package:travelo/features/auth/screens/signin_screen.dart';
import 'package:travelo/features/auth/screens/signup_screen.dart';
import 'package:travelo/features/categories/screens/categories_screen.dart';
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
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpScreen(),
      );
    case SignInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignInScreen(),
      );
    case PlaceDetailsScreen.routeName:
      var place = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PlaceDetailsScreen(
          place: place,
        ),
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
    case ProfilePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProfilePage(),
      );
    case CategoriesScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoriesScreen(
          category: category
        ),
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
