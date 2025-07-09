import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';

class CustomSignUp5TextFieldInstitutionColumn extends StatelessWidget {
  final double institutionSliderValue;
  final ValueChanged<double> onSliderChanged;
  final ValueChanged<String> onLocationChanged;

  const CustomSignUp5TextFieldInstitutionColumn({
    super.key,
    required this.institutionSliderValue,
    required this.onSliderChanged,
    required this.onLocationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        StepsRow(currentIndex: 6),
        const SizedBox(height: 25),
        Text(
          "Additional Information",
          style: AppStyles.urbanistMedium22(context),
        ),
        const SizedBox(height: 25),
        CustomTextField(
          onDataChanged: onLocationChanged,
          text: "Location",
          hintText: "Where are you located? (City/ZIP Code)",
          borderradius: 20,
          validator: (value) {
            return null;
          },
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Radius",
              style: AppStyles.urbanistMedium14(context),
            ),
            Text(
              "How far are you willing to travel to adopt a pet or volunteer?",
              style: AppStyles.urbanistReqular14(context).copyWith(color: Colors.grey),
            ),
            SizedBox(
              width: double.infinity,
              child: Slider(
                activeColor: ColorsApp.primaryColor,
                value: institutionSliderValue,
                min: 0,
                max: 200,
                divisions: 100,
                onChanged: onSliderChanged,
              ),
            ),
            Text(
              "${institutionSliderValue.toInt().toString()} KM",
              style: AppStyles.urbanistReqular16(context).copyWith(color: ColorsApp.primaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
