import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class Custombutton extends StatelessWidget {
  const Custombutton(
      {super.key,
      required this.text,
      this.backGroundColor = ColorsApp.primaryColor,
      this.textColor = Colors.white,
      required this.width,
      this.thereIsBorder = false,
      required this.onTap,
      this.borderradius = 3,
      this.height = 45});

  final String text;
  final Color backGroundColor;
  final Color textColor;
  final double width;
  final double height;
  final VoidCallback onTap;
  final bool thereIsBorder;
  final double borderradius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: thereIsBorder
                ? Border.all(color: Colors.black, width: 1)
                : null,
            color: backGroundColor,
            borderRadius: BorderRadius.circular(borderradius)),
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
