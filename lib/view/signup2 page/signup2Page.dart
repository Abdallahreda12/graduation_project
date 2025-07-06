import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup%20page/widgets/ButtonsRow.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';
import 'package:graduation_project/view/signup2%20page/widgets/typeUserBox.dart';

class Signup2Page extends StatefulWidget {
  const Signup2Page({super.key});

  @override
  State<Signup2Page> createState() => _Signup2PageState();
}

class _Signup2PageState extends State<Signup2Page> {
  late String typeUser = "";
  bool isSelected = false;

  //when data is changed in typeUserBox will calling and update typeUser variable
  void updateData(String data) {
    setState(() {
      typeUser = data;
      isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            //
            //Count Steps
            //
            StepsRow(
              currentIndex: 3,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Who are you?",
              style: AppStyles.urbanistMedium22(context),
            ),
            SizedBox(
              height: 25,
            ),
            //
            //content
            //
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 50,
                runSpacing: 32,
                direction: Axis.horizontal,
                children: [
                  TypeUserBox(
                    isSelected: typeUser == "User",
                    onDataChanged: updateData,
                    text: "User",
                    icon: Assets.imagesUser,
                  ),
                  TypeUserBox(
                    isSelected: typeUser == "Doctor",
                    onDataChanged: updateData,
                    text: "Doctor",
                    icon: Assets.imagesDoctor,
                  ),
                 
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            //
            //Buttons
            //
            ButtonsRow(
              activeNextButton: isSelected,
              secondButtonAction: () {
                if (typeUser == "User") {
                  Get.toNamed("/signup3userpage");
                } else {
                  Get.toNamed("/signup3doctorpage");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
