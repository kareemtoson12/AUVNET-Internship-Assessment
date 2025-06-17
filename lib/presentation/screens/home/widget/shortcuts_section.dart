import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawel/app/app_colors.dart';

class ShortcutsSection extends StatelessWidget {
  const ShortcutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shortcuts:',
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: screenWidth * 0.19,
            crossAxisSpacing: screenWidth * 0.02,
            mainAxisSpacing: screenWidth * 0.005, // قلل المسافة الرأسية هنا
            childAspectRatio:
                0.5, // جرب تقليلها بدل 0.3 لجعل العناصر أكثر توازناً
          ),

          itemCount: _shortcutItems.length,
          itemBuilder: (context, index) {
            final item = _shortcutItems[index];
            return _ShortcutItem(
              imagePath: item['imagePath'] as String,
              label: item['label'] as String,
              isSvg: item['isSvg'] as bool? ?? false,
              isStack: item['isStack'] as bool? ?? false,
            );
          },
        ),
        SizedBox(height: 0),
      ],
    );
  }
}

class _ShortcutItem extends StatelessWidget {
  const _ShortcutItem({
    required this.imagePath,
    required this.label,
    this.isSvg = false,
    this.isStack = false,
  });

  final String imagePath;
  final String label;
  final bool isSvg;
  final bool isStack;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: screenWidth * 0.30,
          height: screenWidth * 0.18,
          decoration: BoxDecoration(
            color: AppColors.lightPurpleColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child:
                isStack
                    ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Security Vault.png',
                          height: screenWidth * 0.13,
                          width: screenWidth * 0.13,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: screenWidth * 0.045,
                          width: screenWidth * 0.045,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              'assets/images/innerfor securityValut.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                    : isSvg
                    ? SvgPicture.asset(
                      imagePath,
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                    )
                    : Image.asset(
                      imagePath,
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                    ),
          ),
        ),
        SizedBox(height: screenWidth * 0.005),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth * 0.036,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

final List<Map<String, Object>> _shortcutItems = [
  {
    'label': 'Past\norders',
    'imagePath': 'assets/images/PastOrders.png',
    'isSvg': false,
  },
  {
    'label': 'Super\nSaver',
    'imagePath': 'assets/images/Security Vault.png',
    'isSvg': false,
    'isStack': true,
  },
  {
    'label': 'Must-tries',
    'imagePath': 'assets/images/innerfor securityValut.png',
    'isSvg': false,
  },
  {
    'label': 'Give Back',
    'imagePath': 'assets/images/GiveBack.png',
    'isSvg': false,
  },
  {
    'label': 'Best\nSellers',
    'imagePath': 'assets/images/BestSellers.png',
    'isSvg': false,
  },
];
