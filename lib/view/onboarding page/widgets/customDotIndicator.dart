import 'package:flutter/material.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.isActive, required this.colorOfDots});

  final bool isActive;
  final Color colorOfDots;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? 32 : 8,
      height: 8,
      decoration: ShapeDecoration(
        color: isActive ? colorOfDots : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colorOfDots),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
