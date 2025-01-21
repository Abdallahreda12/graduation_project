import 'package:flutter/material.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepChart.dart';

class StepsRow extends StatelessWidget {
  const StepsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StepChart(colorIs: true),
        StepChart(colorIs: false),
        StepChart(colorIs: false),
        StepChart(colorIs: false),
        StepChart(colorIs: false)
      ],
    );
  }
}
