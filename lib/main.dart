import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travelo/features/auth/screens/signin_screen.dart';
import 'package:travelo/features/auth/screens/signup_screen.dart';
import 'package:travelo/features/auth/services/auth_services.dart';
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
    return MultiProvider(
      providers: [
        Provider<AuthServices>(
          create: (_) => AuthServices(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthServices>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'TravelO',
        // themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        // theme: theme.getTheme(),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const MainPage();
    }
    return const SignInScreen();
  }
}
