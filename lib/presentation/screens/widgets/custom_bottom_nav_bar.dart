import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/app/app_colors.dart';
import 'package:nawel/data/services/local_storage_service.dart';

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
            onTap: () async {
              setState(() => _selectedIndex = index);
              if (_items[index].label == 'Profile') {
                showProfileSheet(context);
              }
            },
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

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await LocalStorageService.clearUser();
      if (context.mounted) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('/login', (route) => false);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Logout failed: $e')));
      }
    }
  }

  void showProfileSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: AppColors.backgroundWhite,
      builder: (context) {
        final email = LocalStorageService.getUserEmail() ?? 'N/A';
        final uid = LocalStorageService.getUserUid() ?? 'N/A';
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person, size: 64, color: AppColors.primaryPurple),
              const SizedBox(height: 16),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text('UID: $uid', style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop(); // Close the sheet
                    await _logout(context); // Call your logout function
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NavBarItem {
  final String label;
  final String imagePath;
  const _NavBarItem(this.label, this.imagePath);
}
