import 'package:flutter/material.dart';
import 'package:nawel/app/app_colors.dart';
import 'package:nawel/presentation/screens/home/widget/service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Services:',
          style: TextStyle(
            fontSize: screenHeight * 0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            ServiceCard(
              imagePath: 'assets/images/pp.png',
              title: 'Food',
              tag: 'Up to 50%',
              tagColor: AppColors.primaryPurple,
            ),
            ServiceCard(
              imagePath: 'assets/images/medicen.png',
              title: 'Health &wellness',
              tag: '20mins',
              tagColor: AppColors.primaryPurple,
            ),
            ServiceCard(
              imagePath: 'assets/images/gorces.png',
              title: 'Groceries',
              tag: '15 mins',
              tagColor: AppColors.primaryPurple,
            ),
          ],
        ),
      ],
    );
  }
}
