import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/view/adoption%20%20and%20help%20request%20page/widgets/selectTypeOfRequest.dart';

class AdoptionAndHelpRequestPage extends StatefulWidget {
  const AdoptionAndHelpRequestPage({super.key});

  @override
  State<AdoptionAndHelpRequestPage> createState() =>
      _AdoptionAndHelpRequestPageState();
}

class _AdoptionAndHelpRequestPageState
    extends State<AdoptionAndHelpRequestPage> {
  String selectedType = "help";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectTypeOfRequest(
                  isSelected: selectedType == "help",
                  onTap: () {
                    setState(() {
                      selectedType = "help";
                    });
                  },
                  type: "help",
                  borderColor: ColorsApp.secondaryColorOpicaty,
                  image: Assets.imagesAnimalPhoto2,
                  textColor: ColorsApp.secondaryColor,
                ),
                SelectTypeOfRequest(
                    type: "adoption",
                    onTap: () {
                      setState(() {
                        selectedType = "adoption";
                      });
                    },
                    isSelected: selectedType == "adoption",
                    borderColor: ColorsApp.primaryColorOpicaty,
                    image: Assets.imagesAnimalPhoto5,
                    textColor: ColorsApp.primaryColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
