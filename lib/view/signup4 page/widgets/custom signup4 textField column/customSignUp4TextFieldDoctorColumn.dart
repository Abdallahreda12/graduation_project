import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';

class CustomSignUp4TextFieldDoctorColumn extends StatelessWidget {
  final Function(String) onSpecializationChanged;
  final Function(String) onDegreesChanged;
  final Function(String) onLicensingChanged;
  final Function(String) onExperienceChanged;
  final Function(String) onClinicNameChanged;
  final Function(String) onClinicAddressChanged;

  const CustomSignUp4TextFieldDoctorColumn({
    super.key,
    required this.onSpecializationChanged,
    required this.onDegreesChanged,
    required this.onLicensingChanged,
    required this.onExperienceChanged,
    required this.onClinicNameChanged,
    required this.onClinicAddressChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        StepsRow(currentIndex: 4),
        const SizedBox(height: 25),
        Text(
          "Clinic Details",
          style: AppStyles.urbanistMedium22(context),
        ),
        const SizedBox(height: 25),
        CustomTextField(
          onDataChanged: onSpecializationChanged,
          text: "Specialization",
          hintText: "What’s your Specialized?",
          borderradius: 20,
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextField(
          onDataChanged: onDegreesChanged,
          text: "Degrees and Certifications",
          hintText: "Your Academic degree",
          borderradius: 20,
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextField(
          onDataChanged: onLicensingChanged,
          text: "Licensing Information",
          hintText: "Your license number",
          borderradius: 20,
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextField(
          onDataChanged: onExperienceChanged,
          text: "Years Experience",
          hintText: "Years Experience",
          borderradius: 20,
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Clinic Details",
              style: AppStyles.urbanistMedium22(context),
            ),
            Text(
              "Not required if you don't have clinic",
              style: AppStyles.urbanistReqular14(context)
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomTextField(
          onDataChanged: onClinicNameChanged,
          text: "Clinic Name",
          hintText: "What’s your clinic name?",
          borderradius: 20,
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextField(
          onDataChanged: onClinicAddressChanged,
          text: "Clinic Address",
          hintText: "City/Pincode",
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
