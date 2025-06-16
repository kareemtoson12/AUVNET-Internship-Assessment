import 'package:flutter/material.dart';
import '../../../../app/styles.dart'; // Import AppStyles

class OnboardingTextContent extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingTextContent({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyles.onboardingTitleStyle, // Using centralized style
        ),
        const SizedBox(height: 12),
        Text(
          description,
          textAlign: TextAlign.center,
          style:
              AppStyles.onboardingDescriptionStyle, // Using centralized style
        ),
      ],
    );
  }
}
