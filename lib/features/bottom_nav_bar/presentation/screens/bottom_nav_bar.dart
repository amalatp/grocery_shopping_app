// import 'package:flutter/material.dart';
// import 'package:grocery_shopping_app/configs/theme/app_colors.dart';
// import 'package:grocery_shopping_app/features/home/presentation/screens/home_screen.dart';
// import 'package:grocery_shopping_app/features/profile/presentation/profile_screen.dart';
// import 'package:grocery_shopping_app/features/wishlist/presentation/screens/wishlist_screen.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   final List<Widget> _widgetOptions = [
//     const HomeScreen(),
//     const WishlistScreen(),
//     const ProfileScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetOptions[0],
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite), label: 'Wishlist'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//         selectedItemColor: AppColors.primary,
//         unselectedItemColor: AppColors.focus,
//         showUnselectedLabels: false,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/configs/components/default_app_bar.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';
import 'package:grocery_shopping_app/features/home/presentation/screens/home_screen.dart';
import 'package:grocery_shopping_app/features/profile/presentation/profile_screen.dart';
import 'package:grocery_shopping_app/features/wishlist/presentation/screens/wishlist_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const WishlistScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = context.mediaQueryHeight;
    return Scaffold(
      body: _widgetOptions[_selectedIndex], // Display selected screen
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, "Home", 0),
              _buildNavItem(Icons.favorite, "Wishlist", 1),
              _buildNavItem(Icons.person, "Profile", 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    double height = context.mediaQueryHeight;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.focus,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6), // Space between icon and label
              Text(
                label,
                style: TextStyle(color: Colors.white, fontSize: height * 0.014),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
