import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/view/bookPages/AnimalOwnerPage/widgets/formFieldInAnimalOwnerPage.dart';

class AnimalOwnerPage extends StatefulWidget {
  const AnimalOwnerPage({super.key});

  @override
  State<AnimalOwnerPage> createState() => _AnimalOwnerPageState();
}

class _AnimalOwnerPageState extends State<AnimalOwnerPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: Stack(children: [
        Positioned.fill(
          child: SvgPicture.asset(
            Assets.imagesLogoInverse,
            fit: BoxFit.none,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
          child: Column(
            children: [
              //
              //header of page
              //
              TextAndBackArrowHeader(
                  texts: ["Animal Ownar"], colorsOfTexts: [Colors.black]),
              SizedBox(
                height: 25,
              ),
              Form(
                key: _formKey,
                child: Expanded(
                  child: SingleChildScrollView(
                      child: FormFieldInanimalOwnerPage()),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 33,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Custombutton(
              isActive: true,
              text: 'Done',
              width: MediaQuery.sizeOf(context).width,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // If all fields are valid, proceed
                  Get.toNamed("/successpage");
                }
              },
            ),
          ),
        ),
      ]),
    );
  }
}
