import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/AddRequestController.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
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
  @override
  Widget build(BuildContext context) {
    Get.put(AddRequestControllerImp());
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: GetBuilder<AddRequestControllerImp>(
        builder: (controller) => HandleLoadingIndicator(
          isLoading: controller.isLoading,
          widget: Stack(children: [
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
                                isSelected: controller.selectedType == "help",
                                onTap: () {
                                  setState(
                                    () {
                                      controller.selectedType = "help";
                                    },
                                  );
                                },
                                type: "help",
                                borderColor: ColorsApp.secondaryColor,
                                image: Assets.helpPhoto,
                                textColor: ColorsApp.secondaryColor,
                              ),
                              SelectTypeOfRequest(
                                  type: "adoption",
                                  onTap: () {
                                    setState(
                                      () {
                                        controller.selectedType = "adoption";
                                      },
                                    );
                                  },
                                  isSelected:
                                      controller.selectedType == "adoption",
                                  borderColor: ColorsApp.primaryColor,
                                  image: Assets.adoptionPhoto,
                                  textColor: ColorsApp.primaryColor)
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //
                          //request TextFeild
                          //
                          controller.selectedType == "help"
                              //
                              //request for help
                              //
                              ? Form(
                                  key: controller.formKey,
                                  child: TextFiedsInHelpRequest(),
                                )
                              //
                              //request for adoption
                              //
                              : Form(
                                  key: controller.formKey,
                                  child: TextFieldsInAdoptionRequest(),
                                )
                        ],
                      ),
                    ),
                  ),
                  Custombutton(
                    backGroundColor: controller.selectedType == "help"
                        ? ColorsApp.secondaryColor
                        : ColorsApp.primaryColor,
                    text: "Submet",
                    width: MediaQuery.sizeOf(context).width,
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        if (controller.selectedType == 'adoption') {
                          if (controller.gender == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Gender is required"),
                              ),
                            );
                          } else if (controller.size == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Size is required"),
                              ),
                            );
                          } else {
                            controller.addAdoptionRequest();
                            Get.back();
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: ColorsApp.primaryColor,
                                  alignment: Alignment.center,
                                  content: Text(
                                    "Your request was done",
                                    style: AppStyles.urbanistReqular16(context)
                                        .copyWith(color: Colors.white),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        "OK",
                                        style:
                                            AppStyles.urbanistReqular14(context)
                                                .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } else if (controller.selectedType == 'help') {
                          controller.addHelpRequest();

                          Get.back();
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: ColorsApp.secondaryColor,
                                alignment: Alignment.center,
                                content: Text(
                                  "Your request was done",
                                  style: AppStyles.urbanistReqular16(context)
                                      .copyWith(color: Colors.white),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      "OK",
                                      style:
                                          AppStyles.urbanistReqular14(context)
                                              .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
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
        ),
      ),
    );
  }
}
