import 'package:flutter/material.dart';
import 'onboarding_text_content.dart';
// onboarding_buttons.dart will be used outside this widget

class OnboardingPageView extends StatefulWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const OnboardingPageView({
    Key? key,
    required this.pageController,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  int _currentPage = 0;

  final List<Map<String, String>> onboardingContent = [
    {
      'title': 'all-in-one delivery',
      'description':
          'Order groceries, medicines, and meals\ndelivered straight to your door',
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
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      if (widget.pageController.page != null) {
        setState(() {
          _currentPage = widget.pageController.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: widget.pageController,
            itemCount: onboardingContent.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
              widget.onPageChanged(page);
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnboardingTextContent(
                    title: onboardingContent[index]['title']!,
                    description: onboardingContent[index]['description']!,
                  ),
                ],
              );
            },
          ),
        ),
        _buildProgressIndicator(_currentPage),
        const SizedBox(height: 20), // Spacing below progress indicator
      ],
    );
  }

  Widget _buildProgressIndicator(int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingContent.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Colors.purple : Colors.grey,
          ),
        ),
      ),
    );
  }
}
