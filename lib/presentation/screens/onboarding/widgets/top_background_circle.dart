import 'package:flutter/material.dart';

class TopBackgroundCircle extends StatelessWidget {
  const TopBackgroundCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      top: -screenHeight * 0.05, // Responsive top offset
      left: -screenWidth * 0.25, // Responsive left offset
      child: Container(
        width: screenWidth * 0.8, // Responsive width
        height: screenWidth * 0.8, // Responsive height (keep it circular)
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFAC5DDA),
              Color.fromARGB(255, 174, 107, 212),
              Color(0xFFFFC56C),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
