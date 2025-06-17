import 'package:flutter/material.dart';
import 'package:nawel/app/app_colors.dart';

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String tag;
  final Color tagColor;
  final Color tagTextColor;

  const ServiceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.tag,
    this.tagColor = AppColors.primaryPurple,
    this.tagTextColor = AppColors.backgroundWhite,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.28,
      height: screenHeight * 0.22,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: screenHeight * 0.09,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                imagePath,
                height: screenWidth * 0.15,
                width: screenWidth * 0.15,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.008),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: tagColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              tag,
              style: TextStyle(
                color: tagTextColor,
                fontSize: screenWidth * 0.030,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.008),
          Text(
            title.replaceAll(' ', '\n'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.040,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
