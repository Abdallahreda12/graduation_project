import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/styles.dart';

class Section4InDoctorDetailsPage extends StatelessWidget {
  const Section4InDoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Color(0xffD4D4D4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Education",
              style: AppStyles.urbanistMedium16(context),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "M.Sc. - Veterinary Surgery -Emergency and Critical Care.",
              style: AppStyles.urbanistReqular12(context),
            )
          ],
        ));
  }
}
