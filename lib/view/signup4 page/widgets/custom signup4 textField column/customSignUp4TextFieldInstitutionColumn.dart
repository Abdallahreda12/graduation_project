import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';

class CustomSignUp4TextFieldInstitutionColumn extends StatelessWidget {
  final Function(String) onOperatingHoursChanged;
  final Function(String) onTypesAnimalsChanged;
  final Function(String) onServiceAreasChanged;
  final Function(String) onMissionStatementChanged;
  final Function(String) onAdoptionPoliciesChanged;

  const CustomSignUp4TextFieldInstitutionColumn({
    super.key,
    required this.onOperatingHoursChanged,
    required this.onTypesAnimalsChanged,
    required this.onServiceAreasChanged,
    required this.onMissionStatementChanged,
    required this.onAdoptionPoliciesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        StepsRow(currentIndex: 5),
        const SizedBox(height: 25),
        Text(
          "Operational Details",
          style: AppStyles.urbanistMedium22(context),
        ),
        const SizedBox(height: 25),
        CustomTextField(
          onDataChanged: onOperatingHoursChanged,
          text: "Operating Hours",
          hintText: "What’s your Operating Hours?",
          borderradius: 20,
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextField(
          onDataChanged: onTypesAnimalsChanged,
          text: "Types of Animals",
          hintText: "Specify the types of animals they handle",
          borderradius: 20,
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextField(
          onDataChanged: onServiceAreasChanged,
          text: "Service Areas",
          hintText: "Geographic regions the institution serves",
          borderradius: 20,
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 25),
        Text(
          "Institution Mission and Policies",
          style: AppStyles.urbanistMedium22(context),
        ),
        const SizedBox(height: 20),
        CustomTextField(
          onDataChanged: onMissionStatementChanged,
          text: "Mission Statement",
          hintText: "Brief description of the institution's goals and values.",
          borderradius: 20,
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextField(
          onDataChanged: onAdoptionPoliciesChanged,
          text: "Adoption Policies",
          hintText: "Rules regarding who can adopt and under what conditions.",
          borderradius: 20,
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}
