import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<_NavBarItem> _items = [
    _NavBarItem('Home', 'assets/images/HomeIcon.png'),
    _NavBarItem('categories', 'assets/images/categoriesIcon.png'),
    _NavBarItem('deliver', 'assets/images/deliverIcon.png'),
    _NavBarItem('cart', 'assets/images/CartIcon.png'),
    _NavBarItem('Profile', 'assets/images/profileIcon.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_items.length, (index) {
          final selected = _selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = index),
            child: SizedBox(
              width: screenWidth / _items.length,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 8,
                    width: 36,
                    margin: const EdgeInsets.only(bottom: 2),
                    decoration: BoxDecoration(
                      color: selected ? Color(0xff8900FE) : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  Image.asset(
                    _items[index].imagePath,
                    fit: BoxFit.contain,
                    width: 25,
                    height: 25,
                    color:
                        index == 0
                            ? null
                            : (selected
                                ? Color(0xff8900FE)
                                : Color(0xff484C52)),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _items[index].label,
                    style: TextStyle(
                      color: selected ? Color(0xff8900FE) : Colors.grey[700],
                      fontWeight:
                          selected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavBarItem {
  final String label;
  final String imagePath;
  const _NavBarItem(this.label, this.imagePath);
}
