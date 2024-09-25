import 'package:flutter/material.dart';

const kBackgoundColor = Color(0xFF191a2c);
const apiKey = '7502b8c031c79790fe5c0b4f94fd770d';
Color backgroundPrimary = const Color(0xFF111015);




class TextStylePro {
  // Heading 1 Style
  static TextStyle h1Style({
    Color color = Colors.white,
    double fontSize = 34,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Heading 2 Style
  static TextStyle h2Style({
    Color color = Colors.white,
    double fontSize = 28,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Heading 3 Style
  static TextStyle h3Style({
    Color color = Colors.black,
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Additional text styles can be added here
  static TextStyle bodyStyle({
    Color color = Colors.black,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
