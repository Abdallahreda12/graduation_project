import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/controller/signUpController.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
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
    final controller = Get.find<SignUpControllerImp>();
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
          controller: controller.locationController,
          onDataChanged: onLocationChanged,
          text: "Location Link*",
          hintText: "Location of the case",
          validator: (value) =>
              value!.isEmpty ? "Location link is required" : null,
          hintMaxLines: 1,
          borderColor: ColorsApp.secondaryColor,
        ),
        SizedBox(
          height: 5,
        ),
        //
        //two buttons to get location link (will remove but after get suitable design)
        //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Custombutton(
                backGroundColor: ColorsApp.secondaryColor,
                height: 40,
                borderradius: 25,
                text: "get current location",
                width: ((MediaQuery.sizeOf(context).width * 0.5) -
                    10), //doesn't make any effect because there is expanded but it is required so..
                onTap: () {
                  controller.getLinkInCurrentLocation();
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Custombutton(
                  backGroundColor: ColorsApp.secondaryColor,
                  height: 40,
                  borderradius: 25,
                  text: "open google map",
                  width: ((MediaQuery.sizeOf(context).width * 0.5) -
                      10), //doesn't make any effect because there is expanded but it is required so..
                  onTap: () => controller.openMap(context)),
            ),
          ],
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
              style: AppStyles.urbanistReqular14(context)
                  .copyWith(color: Colors.grey),
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
              style: AppStyles.urbanistReqular16(context)
                  .copyWith(color: ColorsApp.primaryColor),
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
