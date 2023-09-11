import 'package:emuladordos/presentation/screens/login.dart';
import 'package:emuladordos/presentation/styles/color_scheme.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;

  void changeTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = _isDarkTheme ? darkColorScheme : lightColorScheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: currentTheme),
      home: const LoginApp(),
    );
  }
}
