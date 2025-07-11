import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/data/models/doctor_model.dart';

class Section5InDoctorDetailsPage extends StatelessWidget {
  final DoctorModel doctor;
  
  const Section5InDoctorDetailsPage({
    super.key,
    required this.doctor,
  });

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
              "Location",
              style: AppStyles.urbanistMedium16(context),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              doctor.loaction,
              style: AppStyles.urbanistReqular12(context),
            )
          ],
        ));
  }
}