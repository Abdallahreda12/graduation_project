import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class TypeUserBox extends StatelessWidget {
  const TypeUserBox(
      {super.key, required this.onDataChanged, required this.text, required this.icon});
  //function will give it body in the parent widget and call it in the child widget
  final Function(String) onDataChanged;
  final String text;
  final String icon;

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
