import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/styles.dart';

class AboutPetInHelpDetailsPage extends StatelessWidget {
  const AboutPetInHelpDetailsPage({
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
          "About Pet",
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
