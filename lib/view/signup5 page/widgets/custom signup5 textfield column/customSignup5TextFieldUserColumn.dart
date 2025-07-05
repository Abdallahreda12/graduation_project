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

class CustomSignUp5TextFieldUserColumn extends StatelessWidget {
  final String userLocation;
  final Function(String) onLocationChanged;
  final String userturnOnNotification;
  final Function(String) onNotificationChanged;

  const CustomSignUp5TextFieldUserColumn({
    super.key,
    required this.userLocation,
    required this.onLocationChanged,
    required this.userturnOnNotification,
    required this.onNotificationChanged,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpControllerImp>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        // Steps Row
        StepsRow(currentIndex: 5),
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
          borderColor: ColorsApp.primaryColor,
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
                backGroundColor: ColorsApp.primaryColor,
                height: 40,
                borderradius: 25,
                text: "get current location",
                width: ((MediaQuery.sizeOf(context).width * 0.5) -
                    10), //doesn't make any effect because there is expanded but it is required so..
                onTap: () {
                  controller.getLinkInCurrentLocation();
                  print(controller.locationController.text);
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Custombutton(
                  backGroundColor: ColorsApp.primaryColor,
                  height: 40,
                  borderradius: 25,
                  text: "open google map",
                  width: ((MediaQuery.sizeOf(context).width * 0.5) -
                      10), //doesn't make any effect because there is expanded but it is required so..
                  onTap: () => controller.openMap(context)),
            ),
          ],
        ),
        const SizedBox(height: 10),

        CustomCheckListTile(
          options: ["Yes", "No"],
          question: "Turn on notification ",
          onDataChanged: onNotificationChanged,
        ),
      ],
    );
  }
}
