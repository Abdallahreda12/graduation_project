import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';

class HeaderSignInpage extends StatelessWidget {
  const HeaderSignInpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -150,
      right: -60,
      left: -60,
      child: ClipOval(
        child: Container(
          color: ColorsApp.primaryColor,
          width: MediaQuery.of(context).size.width,
          height: 500,
          child: Transform.translate(
            offset: Offset(0, -10),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                Assets.imagesLoginPhoto,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
