import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/styles.dart';

class Section3InDoctorDetailsPage extends StatelessWidget {
  const Section3InDoctorDetailsPage({super.key});

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
              "About",
              style: AppStyles.urbanistMedium16(context),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Experienced veterinarian specializing in small animal care, with a focus on treatment, surgery, and emergency services. Passionate about animal welfare and preventive care.",
              style: AppStyles.urbanistReqular12(context),
            )
          ],
        ));
  }
}
