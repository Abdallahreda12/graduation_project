import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class AdoptionAndHelpRequestPage extends StatefulWidget {
  const AdoptionAndHelpRequestPage({super.key});

  @override
  State<AdoptionAndHelpRequestPage> createState() =>
      _AdoptionAndHelpRequestPageState();
}

class _AdoptionAndHelpRequestPageState
    extends State<AdoptionAndHelpRequestPage> {
  String requestType = "help";
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      requestType = "help";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: requestType == "help"
                          ? Border.all(
                              color: ColorsApp.secondaryColor, width: 1)
                          : null,
                    ),
                    child: Container(
                      width: (MediaQuery.sizeOf(context).width / 2) - 35,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          scale: 2,
                          image: AssetImage(Assets.imagesAnimalPhoto2),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5, left: 10),
                            child: Text(
                              "help",
                              style: AppStyles.urbanistMedium16(context)
                                  .copyWith(color: ColorsApp.secondaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        requestType = "adoption";
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: requestType == "adoption"
                          ? Border.all(color: ColorsApp.primaryColor, width: 1)
                          : null,
                    ),
                    child: Container(
                      width: (MediaQuery.sizeOf(context).width / 2) - 35,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              scale: 2,
                              image: AssetImage(Assets.imagesAnimalPhoto1))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5, left: 10),
                            child: Text(
                              "adoption",
                              style: AppStyles.urbanistMedium16(context)
                                  .copyWith(color: ColorsApp.primaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
