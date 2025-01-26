import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class TypeUserBox extends StatelessWidget {
  const TypeUserBox(
      {super.key,
      required this.onDataChanged,
      required this.text,
      required this.icon,
      this.isSelected = false});
  //function will give it body in the parent widget and call it in the child widget
  final Function(String) onDataChanged;
  final String text;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onDataChanged(text);
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          boxShadow: isSelected
              ? null
              : [
                  BoxShadow(
                    color: Colors.grey.withAlpha(120), // Shadow color
                    spreadRadius: 3, // Spread of the shadow
                    blurRadius: 4, // Softness of the shadow
                    offset: Offset(0, 3), // Horizontal and vertical offset
                  ),
                ],
          color: ColorsApp.backGroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            Text(
              text,
              style: AppStyles.urbanistMedium22(context),
            )
          ],
        ),
      ),
    );
  }
}
