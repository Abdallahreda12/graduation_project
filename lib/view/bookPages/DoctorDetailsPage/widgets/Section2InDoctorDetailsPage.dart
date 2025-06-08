import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class Section2InDoctorDetailsPage extends StatelessWidget {
  const Section2InDoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Color(0xffD4D4D4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sick Animal",
                style: AppStyles.urbanistReqular14(context)
                    .copyWith(color: Color(0xff7C7D89)),
              ),
              Text(
                "456k",
                style: AppStyles.urbanistSemiBold20(context)
                    .copyWith(color: ColorsApp.primaryColor),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Experience",
                style: AppStyles.urbanistReqular14(context)
                    .copyWith(color: Color(0xff7C7D89)),
              ),
              Text(
                "8 Years",
                style: AppStyles.urbanistSemiBold20(context)
                    .copyWith(color: ColorsApp.primaryColor),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Review",
                style: AppStyles.urbanistReqular14(context)
                    .copyWith(color: Color(0xff7C7D89)),
              ),
              Text(
                "6.8k",
                style: AppStyles.urbanistSemiBold20(context)
                    .copyWith(color: ColorsApp.primaryColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
