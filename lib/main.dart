import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/activity/presentation/views/home_view.dart';

void main() {
  runApp(const BugunNeYapalimApp());
}

class BugunNeYapalimApp extends StatelessWidget {
  const BugunNeYapalimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bugün Ne Yapalım?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomeView(),
    );
  }
}
