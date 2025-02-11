import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customImageSlider.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';


class AdoptionDetailsPage extends StatefulWidget {
  const AdoptionDetailsPage({super.key});

  @override
  State<AdoptionDetailsPage> createState() => _AdoptionDetailsPageState();
}

class _AdoptionDetailsPageState extends State<AdoptionDetailsPage> {
  final List<String> imagePaths = [
    Assets.imagesAnimalPhoto1,
    Assets.imagesAnimalPhoto2,
    Assets.imagesAnimalPhoto5,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
        child: Column(
          children: [
            TextAndBackArrowHeader(
              texts: ["Adoption", " Details"],
              colorsOfTexts: [ColorsApp.primaryColor, Colors.black],
            ),
            SizedBox(
              height: 25,
            ),
            CustomImagesSlider(
              imagePaths: imagePaths,
              colorsOfDots: ColorsApp.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
