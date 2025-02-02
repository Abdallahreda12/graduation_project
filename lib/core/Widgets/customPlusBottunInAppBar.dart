import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';

class CustomPlusBottunInAppBar extends StatelessWidget {
  const CustomPlusBottunInAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: FloatingActionButton(
        elevation: 0,
        shape: CircleBorder(),
        onPressed: () {},
        backgroundColor: ColorsApp.primaryColor,
        child: SvgPicture.asset(
          Assets.imagesPlusAppBarIcon,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
