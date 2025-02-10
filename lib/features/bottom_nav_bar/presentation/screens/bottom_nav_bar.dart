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
import 'package:grocery_shopping_app/configs/constants/app_svg.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';
import 'package:grocery_shopping_app/features/home/presentation/screens/home_screen.dart';
import 'package:grocery_shopping_app/features/profile/presentation/profile_screen.dart';
import 'package:grocery_shopping_app/features/wishlist/presentation/screens/wishlist_screen.dart';
import 'package:svg_flutter/svg.dart';

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
      bottomNavigationBar: Container(
        height: height * 0.07,
        margin: EdgeInsets.only(right: 20, left: 20, bottom: height * 0.015),
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(116, 116, 116, 0.15),
                  blurRadius: 25,
                  spreadRadius: 0,
                  offset: Offset(0, 4))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(AppSvg.home, "Home", 0),
            _buildNavItem(AppSvg.wishlist, "Wishlist", 1),
            _buildNavItem(AppSvg.profile, "Profile", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    double height = context.mediaQueryHeight;
    double width = context.mediaQueryWidth;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width * 0.25,
        height: height * 0.07,
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: height * 0.025,
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
