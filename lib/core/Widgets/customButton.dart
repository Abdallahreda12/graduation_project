import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class Custombutton extends StatelessWidget {
  const Custombutton(
      {super.key,
      required this.text,
      this.backGroundColor = ColorsApp.primaryColor,
      this.textColor = Colors.white,
      required this.width});

  final String text;
  final Color backGroundColor;
  final Color textColor;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        height: 45,
        decoration: BoxDecoration(
            color: backGroundColor, borderRadius: BorderRadius.circular(3)),
        child: Center(
          child: Text(
            text,
            style: AppStyles.urbanistSemiBold14(context)
                .copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
