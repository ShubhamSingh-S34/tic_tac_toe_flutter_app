import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final List<Shadow> shadows;
  final double fontSize;
  const CustomText(
      {super.key,
      required this.text,
      required this.shadows,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: shadows,
          fontSize: fontSize),
    );
  }
}
