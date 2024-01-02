import 'package:flutter/material.dart';
import 'package:lab45/home/home_screen.dart';


void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 27, 20, 39),
      ),
      home: HomeScreen(),
    );
  }
}