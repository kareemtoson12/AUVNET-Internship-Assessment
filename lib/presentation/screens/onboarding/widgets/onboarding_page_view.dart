import 'package:flutter/material.dart';
import 'onboarding_text_content.dart';
// onboarding_buttons.dart will be used outside this widget

class OnboardingPageView extends StatefulWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const OnboardingPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final List<Map<String, String>> _pages = [
    {
      'title': 'all-in-one delivery',
      'description':
          'Order groceries, medicines, and meals delivered straight to your door',
    },
    {
      'title': 'User-to-User Delivery',
      'description':
          'Send or receive items from other users quickly and easily',
    },
    {
      'title': 'Sales & Discounts',
      'description': 'Discover exclusive sales and deals every day',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: widget.pageController,
            onPageChanged: widget.onPageChanged,
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return OnboardingTextContent(
                title: _pages[index]['title']!,
                description: _pages[index]['description']!,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _pages.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: index == 0 ? Colors.purple : Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
