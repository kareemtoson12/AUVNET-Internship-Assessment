import 'package:flutter/material.dart';
import 'package:nawel/app/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryPurple,

              AppColors.orange,
            ], // Shades of purple, pink, and orange
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        padding: EdgeInsets.fromLTRB(
          screenWidth * 0.05,
          screenHeight * 0.06,
          screenWidth * 0.05,
          screenHeight * 0.03,
        ), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Delivering to',
                      style: TextStyle(
                        color: AppColors.blackText,
                        fontSize: screenHeight * 0.02,
                      ), // Responsive font size
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ), // Responsive spacing
                    Text(
                      'Al Satwa, 81A Street',
                      style: TextStyle(
                        color: AppColors.blackText,
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: screenHeight * 0.035, // Responsive avatar size
                  backgroundImage:
                      Image.asset(
                        'assets/images/person.png',
                      ).image, // User profile picture
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01), // Responsive spacing
            Text(
              'Hi hepa!',
              style: TextStyle(
                color: AppColors.backgroundWhite,
                fontSize: screenHeight * 0.04, // Responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(200.0); // Adjust height as needed
}
