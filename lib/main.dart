import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelo/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: const MainPage(),
    );
  }
}
