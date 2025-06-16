import 'package:flutter/material.dart';
import '../../../../app/styles.dart'; // Import AppStyles

class OnboardingButtons extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final int totalPages;

  const OnboardingButtons({
    Key? key,
    required this.pageController,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLastPage = currentPage == totalPages - 1;

    return Column(
      children: [
        SizedBox(
          width: screenWidth * 0.75,
          child: ElevatedButton(
            onPressed: () {
              if (isLastPage) {
                // Navigate to login screen
                Navigator.pushReplacementNamed(context, '/login');
              } else {
                // This button is for Get Started, so it should always go to login if on last page.
                // The 'next' functionality is handled by the GestureDetector below.
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9100F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
            ),
            child: Text(
              'Get Started',
              // Changed this to reflect Get Started on last page
              style: AppStyles.getStartedButtonStyle,
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.03),

        GestureDetector(
          onTap: () {
            if (!isLastPage) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Text('next', style: AppStyles.nextButtonStyle),
        ),

        SizedBox(height: screenWidth * 0.05),
      ],
    );
  }
}
