import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customCheckBoxList.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';

class CustomSignUp4TextFieldUserColumn extends StatelessWidget {
  final Function(String) onAgeRangeChanged;
  final Function(String) onAdoptionStatusChanged;
  final Function(String) onAdoptionPreferenceChanged;
  final Function(String) onPreviousAdoptionChanged;
  final Function(String) onExperienceChanged;
  final String? selectedGender;
  const CustomSignUp4TextFieldUserColumn({
    super.key,
    required this.onAgeRangeChanged,
    required this.onAdoptionStatusChanged,
    required this.onAdoptionPreferenceChanged,
    required this.onPreviousAdoptionChanged,
    required this.onExperienceChanged,
    this.selectedGender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        //
        // Steps Row
        //
        StepsRow(currentIndex: 5),
        const SizedBox(height: 25),
        Text(
          "Personal Information",
          style: AppStyles.urbanistMedium22(context),
        ),
        const SizedBox(height: 25),
        CustomCheckListTile(
          options: ["Puppy/Kitten", "Young", "Adult"],
          question: "Age Range of animals that you preferred",
          onDataChanged: onAgeRangeChanged,
        ),
        CustomCheckListTile(
          options: ["Yes", "No"],
          question: "Are you looking for adoption?",
          onDataChanged: onAdoptionStatusChanged,
        ),
        CustomCheckListTile(
          options: ["Cat", "Dog", "Other (e.g., rabbit, bird)"],
          question: "Animals adoption preferred",
          onDataChanged: onAdoptionPreferenceChanged,
        ),
        CustomCheckListTile(
          options: ["Yes", "No"],
          question: "Have you adopted before?",
          onDataChanged: onPreviousAdoptionChanged,
        ),
        CustomCheckListTile(
          options: ["Yes", "No", "Little knowledge"],
          question: "Do you have experience with animal care?",
          onDataChanged: onExperienceChanged,
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}
