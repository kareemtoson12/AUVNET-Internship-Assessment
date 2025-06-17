import 'package:flutter/material.dart';

class AdvertisingCarousel extends StatefulWidget {
  const AdvertisingCarousel({super.key});

  @override
  State<AdvertisingCarousel> createState() => _AdvertisingCarouselState();
}

class _AdvertisingCarouselState extends State<AdvertisingCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: screenHeight * 0.2,
          child: PageView.builder(
            controller: _controller,
            itemCount: 5,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder:
                (context, index) => Center(
                  child: Image.asset(
                    'assets/images/advertising.png',
                    fit: BoxFit.cover,
                    width: screenWidth * 0.8,
                  ),
                ),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.purple : Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
