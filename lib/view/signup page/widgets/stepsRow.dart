import 'package:flutter/material.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepChart.dart';

class StepsRow extends StatelessWidget {
  const StepsRow({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StepChart(colorIs: currentIndex >= 1),
        StepChart(colorIs: currentIndex >= 2),
        StepChart(colorIs: currentIndex >= 3),
        StepChart(colorIs: currentIndex >= 4),
        StepChart(colorIs: currentIndex >= 5),
        StepChart(colorIs: currentIndex >= 6)
      ],
    );
  }
}
