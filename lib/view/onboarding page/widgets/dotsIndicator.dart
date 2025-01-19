import 'package:flutter/material.dart';
import 'package:graduation_project/view/onboarding%20page/widgets/customDotIndicator.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key, required this.currentCardIndex});

  final int currentCardIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CustomDotIndicator(isActive: index == currentCardIndex),
        ),
      ),
    );
  }
}
