import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class FirstListViewInHomePage extends StatelessWidget {
  const FirstListViewInHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore ways to help",
          style: AppStyles.urbanistMedium16(context),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 155,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: ColorsApp.backGroundGreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          //take photo and put it here
                          Assets.imagesAnimalPhoto2,
                          fit: BoxFit.fill,
                          width: 130,
                          height: 100,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //take text and put it here
                      Text("Volunteers",
                          style: AppStyles.urbanistMedium16(context)),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
