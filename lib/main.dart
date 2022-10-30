import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travelo/features/auth/screens/signup_screen.dart';
import 'package:travelo/globals/themer/theme_manager.dart';
import 'package:travelo/main_page.dart';
import 'package:travelo/router.dart';

void main() {
  // runApp(const MyApp());
  return runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        title: 'TravelO',
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        //   textTheme: GoogleFonts.poppinsTextTheme(),
        // ),
        theme: theme.getTheme(),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const SignUpScreen(),
      ),
    );
  }
}
