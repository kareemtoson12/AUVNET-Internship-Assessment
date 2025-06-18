import 'package:flutter/material.dart';

import 'widgets/top_background_circle.dart';
import 'widgets/nawel_logo_and_text.dart';
import 'widgets/onboarding_page_view.dart';
import 'widgets/onboarding_buttons.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            const TopBackgroundCircle(),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const NawelLogoAndText(),
                  const SizedBox(height: 20),
                  Expanded(
                    child: OnboardingPageView(
                      pageController: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                    ),
                  ),
                  OnboardingButtons(
                    pageController: _pageController,
                    currentPage: _currentPage,
                    totalPages: _totalPages,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
