import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: ColorsApp.primaryColor,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(Assets.imagesDoctorImage),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr.Kalini Jithma",
                style: AppStyles.urbanistSemiBold14(context)
                    .copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Veterinary Behavioral",
                style: AppStyles.urbanistReqular12(context)
                    .copyWith(color: Color(0xffD9D9D9)),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.imagesPetsAppBarIcon,
                    width: 18,
                    height: 18,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  Text("4.5",
                      style: AppStyles.urbanistReqular12(context).copyWith(
                        color: Color(0xffD9D9D9),
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
