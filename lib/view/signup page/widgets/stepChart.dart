import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';

class StepChart extends StatelessWidget {
  const StepChart({super.key, this.count = 5, required this.colorIs});

  final int count;
  final bool colorIs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      //70 -> 60 padding of all screen and 10 for padding of each side for shart
      width: (MediaQuery.sizeOf(context).width - 130) / (count),
      height: 6,
      decoration: BoxDecoration(
        color: colorIs ? ColorsApp.primaryColor : ColorsApp.backGroundGreyColor,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
