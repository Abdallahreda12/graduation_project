import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class RequestInformationInHelpDetailsPage extends StatelessWidget {
  const RequestInformationInHelpDetailsPage({
    super.key,
    required this.dateAndTime,
    required this.socialMediaLink,
    required this.location,
  });

  final String dateAndTime;
  final String socialMediaLink;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //37 -> 27 padding + 8 space between two item
          width: (MediaQuery.of(context).size.width) - 35,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(color: ColorsApp.secondaryColorOpicaty),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date & Time",
                style: AppStyles.urbanistReqular12(context)
                    .copyWith(color: Color(0xff6A6A6A)),
              ),
              SizedBox(
                height: 2,
              ),
              Text(dateAndTime, style: AppStyles.urbanistSemiBold12(context))
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
          decoration: BoxDecoration(color: ColorsApp.secondaryColorOpicaty),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Social Media Link",
                style: AppStyles.urbanistReqular12(context)
                    .copyWith(color: Color(0xff6A6A6A)),
              ),
              SizedBox(
                height: 2,
              ),
              Text(socialMediaLink,
                  style: AppStyles.urbanistSemiBold12(context))
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
          decoration: BoxDecoration(color: ColorsApp.secondaryColorOpicaty),
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
