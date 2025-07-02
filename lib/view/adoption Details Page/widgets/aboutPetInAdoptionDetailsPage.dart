import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/styles.dart';

class AboutPetInAdoptionDetailsPage extends StatelessWidget {
  const AboutPetInAdoptionDetailsPage({
    super.key,
    required this.aboutPet,
  });
  final String aboutPet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: AppStyles.urbanistSemiBold16(context),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          aboutPet,
          style: AppStyles.urbanistReqular12(context),
        ),
      ],
    );
  }
}
