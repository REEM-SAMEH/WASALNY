import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Wasalny/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(), // Ensure class name matches
                      ),
                    );
                  },
                  child: Image.asset('assets/images/icon.png', // Replace with the correct path to your icon
                    width: 350, // Adjust width as needed
                    height: 350, // Adjust height as needed
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
