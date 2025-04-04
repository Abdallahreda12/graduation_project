import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/view/adoption%20%20and%20help%20request%20page/widgets/selectTypeOfRequest.dart';
import 'package:graduation_project/view/adoption%20%20and%20help%20request%20page/widgets/textFieldInHelpRequest.dart';
import 'package:graduation_project/view/adoption%20%20and%20help%20request%20page/widgets/textFieldsInAdoptionRequest.dart';

class AdoptionAndHelpRequestPage extends StatefulWidget {
  const AdoptionAndHelpRequestPage({super.key});

  @override
  State<AdoptionAndHelpRequestPage> createState() =>
      _AdoptionAndHelpRequestPageState();
}

class _AdoptionAndHelpRequestPageState
    extends State<AdoptionAndHelpRequestPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String selectedType = "help";

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
          padding: const EdgeInsets.only(left: 27, right: 27, top: 35),
          child: Column(
            children: [
              TextAndBackArrowHeader(
                texts: ["Adoption", " & ", "help", " request"],
                colorsOfTexts: [
                  ColorsApp.primaryColor,
                  Colors.black,
                  ColorsApp.secondaryColor,
                  Colors.black
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectTypeOfRequest(
                            isSelected: selectedType == "help",
                            onTap: () {
                              setState(
                                () {
                                  selectedType = "help";
                                },
                              );
                            },
                            type: "help",
                            borderColor: ColorsApp.secondaryColor,
                            image: Assets.imagesAnimalPhoto2,
                            textColor: ColorsApp.secondaryColor,
                          ),
                          SelectTypeOfRequest(
                              type: "adoption",
                              onTap: () {
                                setState(
                                  () {
                                    selectedType = "adoption";
                                  },
                                );
                              },
                              isSelected: selectedType == "adoption",
                              borderColor: ColorsApp.primaryColor,
                              image: Assets.imagesAnimalPhoto1,
                              textColor: ColorsApp.primaryColor)
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //
                      //request TextFeild
                      //
                      selectedType == "help"
                          //
                          //request for help
                          //
                          ? Form(
                              key: formKey,
                              child: TextFiedsInHelpRequest(),
                            )
                          //
                          //request for adoption
                          //
                          : Form(
                              key: formKey,
                              child: TextFieldsInAdoptionRequest(),
                            )
                    ],
                  ),
                ),
              ),
              Custombutton(
                text: "Submet",
                width: MediaQuery.sizeOf(context).width,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("your request was done"),
                      ),
                    );
                    Get.back();
                  }
                },
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
