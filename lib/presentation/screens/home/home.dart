import 'package:flutter/material.dart';
import 'package:nawel/presentation/screens/home/widget/custom_app_bar.dart';
import 'package:nawel/presentation/screens/home/widget/services_section.dart';
import 'package:nawel/presentation/screens/home/widget/got_a_code_section.dart';
import 'package:nawel/presentation/screens/home/widget/shortcuts_section.dart';
import 'package:nawel/presentation/screens/home/widget/advertising_carousel.dart';
import 'package:nawel/presentation/screens/home/widget/popular_restaurants_nearby.dart';
import 'package:nawel/presentation/screens/widgets/custom_bottom_nav_bar.dart';

import 'package:nawel/app/app_colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const ServicesSection(),

              const GotACodeSection(),

              const ShortcutsSection(),
              SizedBox(height: screenHeight * 0.01),
              const AdvertisingCarousel(),
              SizedBox(height: screenHeight * 0.05),
              PopularRestaurantsNearby(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
