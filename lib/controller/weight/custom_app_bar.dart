import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Image.asset("assets/logo.png",height: 150,width: 150,), // You can customize the title
     
       
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Customize the height if needed
}
