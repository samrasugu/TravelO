import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travelo/features/auth/screens/signin_screen.dart';
import 'package:travelo/features/auth/screens/signup_screen.dart';
import 'package:travelo/features/home/home_screen.dart';
import 'package:travelo/firebase_options.dart';
import 'package:travelo/globals/themer/theme_manager.dart';
import 'package:travelo/main_page.dart';
import 'package:travelo/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  // return runApp(
  //   ChangeNotifierProvider<ThemeNotifier>(
  //     create: (_) => ThemeNotifier(),
  //     child: const MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelO',
      // themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      // theme: theme.getTheme(),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const SignUpScreen(),
    );
  }
}
