
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:assignment_test/view/home_screen.dart';
import 'package:assignment_test/view/search_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final iconList = <IconData>[
     Icons.home,
    Icons.search,
   
  
  ];

  final List<Widget> _pages = [
   
   const HomeScreen(),
   const SearchScreen(),
  ];

  // final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Colors.black,
        child: const Icon(Icons.movie_sharp,color: Colors.white,),
        onPressed: () {
          setState(() {
            _currentIndex = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
     
        icons: iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center, // Change to GapLocation.end if needed
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        activeColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        inactiveColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      ),
    );
  }
}