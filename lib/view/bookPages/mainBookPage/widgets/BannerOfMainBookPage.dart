import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class BannerOfMainBookPage extends StatelessWidget {
  const BannerOfMainBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(Assets.imagesbannerMainBookPage),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Round the blur container
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 8, sigmaY: 8), // Apply blur only here
              child: GestureDetector(
                onTap: () {
                  Get.toNamed("/tipsandtricksforyourpetspage");
                },
                child: Container(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width *
                      0.90, // Slightly smaller
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withAlpha(102),
                        Colors.white.withAlpha(22),
                        ColorsApp.primaryColor,
                        ColorsApp.secondaryColor
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Take care of pet's health",
                              style: AppStyles.urbanistSemiBold16(context)),
                          SizedBox(height: 4),
                          Text("Tips and tricks for your pet",
                              style: AppStyles.urbanistReqular12(context)),
                        ],
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ColorsApp.primaryColor,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
