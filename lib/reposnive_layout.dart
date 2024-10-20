import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  Widget mobile;
  Widget tablet;
 

  ResponsiveLayout(
      {required this.mobile, required this.tablet, })
      : super();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobile;
      } else  {
        return tablet;
      } 
      
    });
  }
}