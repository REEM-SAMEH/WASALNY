import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Icon icon;

  const CustomText({required this.text, required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: Colors.white, // White text color
            fontSize: 24, // Adjust font size as needed
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 3.0,
                color: Colors.black, // Black shadow color
              ),
            ],
          ),
        ),
      ],
    );
  }
}
