import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<_NavBarItem> _items = [
    _NavBarItem('Home', Icons.home),
    _NavBarItem('categories', Icons.apps),
    _NavBarItem('deliver', Icons.delivery_dining),
    _NavBarItem('cart', Icons.shopping_cart_outlined),
    _NavBarItem('Profile', Icons.person_outline),
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
                  // Top indicator
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 8,
                    width: 36,
                    margin: const EdgeInsets.only(bottom: 2),
                    decoration: BoxDecoration(
                      color: selected ? Colors.purple : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  Icon(
                    _items[index].icon,
                    color: selected ? Colors.purple : Colors.grey[700],
                    size: 28,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _items[index].label,
                    style: TextStyle(
                      color: selected ? Colors.purple : Colors.grey[700],
                      fontWeight:
                          selected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 15,
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
  final IconData icon;
  const _NavBarItem(this.label, this.icon);
}
