import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? 32 : 8,
      height: 8,
      decoration: ShapeDecoration(
        color: isActive ? ColorsApp.primaryColor : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorsApp.primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
