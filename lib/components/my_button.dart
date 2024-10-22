import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;

  // Constructor with onPressed callback
  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // This triggers the onPressed function when tapped
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Sign in',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
