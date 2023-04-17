import 'package:flutter/material.dart';
import 'input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMIX",
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.black),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: "press",
      ),
      home: MainPage(),
    );
  }
}
