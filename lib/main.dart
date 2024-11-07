import 'package:flutter/material.dart';
import 'package:Wasalny/welcome_screen.dart';
import 'package:Wasalny/welcome_screen.dart'; // Ensure the path matches your project structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wasalny',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: WelcomeScreen(), // Set HomeScreen as the initial screen
    );
  }
}
