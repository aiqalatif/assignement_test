import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_flutter/view/weight/const.dart'; // Assuming 'textStyle' is defined in 'const.dart'

class CustomAppBr extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Title for the AppBar
  final String temperature; // Temperature to display

  const CustomAppBr({
    Key? key,
    required this.title,
    required this.temperature,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.orangeAccent, // Set the AppBar background color
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(5), // Adjust the radius as needed
          ),
        ),
        child: AppBar(
          elevation: 0, 
          leading: const SizedBox.shrink(), 
          titleSpacing: 0, 
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title, 
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white, // Text color
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), 
              child: Row(
                children: [
                 
                const  Icon(
                    Icons.thermostat,
                    color: Colors.white, 
                    size: 24, 
                  ),
                  const SizedBox(width: 8), 
                 
                  Text(
                    temperature, 
                    style: const TextStyle(
                      fontSize: 20, 
                      color: Colors.white, 
                    ),
                  ),
                ],
              ),
            ),
          ],
          backgroundColor: Colors.transparent, // Make AppBar background transparent
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // AppBar height
}
