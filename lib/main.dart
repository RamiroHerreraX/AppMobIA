import 'package:flutter/material.dart';
import 'intro_screen.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _seenIntro = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _seenIntro
          ? const HomePage()
          : IntroScreen(
              onDone: () {
                setState(() {
                  _seenIntro = true;
                });
              },
            ),
    );
  }
}
