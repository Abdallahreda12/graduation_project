import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';

class Headerofpage extends StatelessWidget {
  const Headerofpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -250,
      right: -60,
      left: -60,
      child: ClipOval(
        child: Container(
          color: ColorsApp.primaryColor,
          width: MediaQuery.of(context).size.width,
          height: 500,
          child: Transform.translate(
            offset: Offset(0, 120),
            child: FittedBox(
              fit: BoxFit.none,
              child: SvgPicture.asset(
                Assets.imagesLogoInverse,
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
