import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class RequestInformationInAdoptionDetailsPage extends StatelessWidget {
  const RequestInformationInAdoptionDetailsPage(
      {super.key,
      required this.gender,
      required this.type,
      required this.size,
      required this.age,
      required this.location});

  final String gender;
  final String type;
  final String size;
  final String age;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //37 -> 27 padding + 8 space between two item
                width: (MediaQuery.of(context).size.width / 2) - 35,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(color: ColorsApp.backGroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gender",
                      style: AppStyles.urbanistReqular12(context)
                          .copyWith(color: Color(0xff6A6A6A)),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(gender, style: AppStyles.urbanistSemiBold12(context))
                  ],
                ),
              ),
              Container(
                //35 -> 27 padding + 8 space between two item
                width: (MediaQuery.of(context).size.width / 2) - 35,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(color: ColorsApp.backGroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Type",
                      style: AppStyles.urbanistReqular12(context)
                          .copyWith(color: Color(0xff6A6A6A)),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      type,
                      style: AppStyles.urbanistSemiBold12(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //37 -> 27 padding + 8 space between two item
                width: (MediaQuery.of(context).size.width / 2) - 35,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(color: ColorsApp.backGroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Size",
                      style: AppStyles.urbanistReqular12(context)
                          .copyWith(color: Color(0xff6A6A6A)),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(size, style: AppStyles.urbanistSemiBold12(context))
                  ],
                ),
              ),
              Container(
                //35 -> 27 padding + 8 space between two item
                width: (MediaQuery.of(context).size.width / 2) - 35,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(color: ColorsApp.backGroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Age",
                      style: AppStyles.urbanistReqular12(context)
                          .copyWith(color: Color(0xff6A6A6A)),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      age,
                      style: AppStyles.urbanistSemiBold12(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          //37 -> 27 padding + 8 space between two item
          width: (MediaQuery.of(context).size.width) - 35,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(color: ColorsApp.backGroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: AppStyles.urbanistReqular12(context)
                    .copyWith(color: Color(0xff6A6A6A)),
              ),
              SizedBox(
                height: 2,
              ),
              Text(location, style: AppStyles.urbanistSemiBold12(context))
            ],
          ),
        ),
      ],
    );
  }
}
