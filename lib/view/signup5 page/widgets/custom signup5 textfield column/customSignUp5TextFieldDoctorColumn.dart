import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customCheckBoxList.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';

class CustomSignUp5TextFieldDoctorColumn extends StatelessWidget {
  final double doctorSliderValue;
  final Function(double) onSliderChanged;
  final Function(String) onLocationChanged;
  final Function(String) onHomeVisitsChanged;
  final Function(String) onTurnOnNotificationChanged;

  const CustomSignUp5TextFieldDoctorColumn({
    super.key,
    required this.doctorSliderValue,
    required this.onSliderChanged,
    required this.onLocationChanged,
    required this.onHomeVisitsChanged,
    required this.onTurnOnNotificationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        StepsRow(currentIndex: 5),
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
                value: doctorSliderValue,
                min: 0,
                max: 200,
                divisions: 100,
                onChanged: onSliderChanged,
              ),
            ),
            Text(
              "${doctorSliderValue.toInt().toString()} KM",
              style: AppStyles.urbanistReqular16(context).copyWith(color: ColorsApp.primaryColor),
            ),
          ],
        ),
        const SizedBox(height: 10),
        CustomCheckListTile(
          options: ["Yes", "No"],
          question: "Home Visits",
          onDataChanged: onHomeVisitsChanged,
        ),
        const SizedBox(height: 10),
        CustomCheckListTile(
          options: ["Yes", "No"],
          question: "Turn on notification",
          onDataChanged: onTurnOnNotificationChanged,
        ),
      ],
    );
  }
}
