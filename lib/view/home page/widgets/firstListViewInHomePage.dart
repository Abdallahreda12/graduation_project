import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/tips%20and%20tricks%20pages/Data/TipsAndTricksForYourPetsPageData.dart';

class FirstListViewInHomePage extends StatefulWidget {
  const FirstListViewInHomePage({super.key});

  @override
  State<FirstListViewInHomePage> createState() =>
      _FirstListViewInHomePageState();
}

class _FirstListViewInHomePageState extends State<FirstListViewInHomePage> {
  List<String> headers = [];

//this list that will shown it in the home page (Take care the names must be the same in the TipsAndTricksForYOurPetsData)
  final List<String> tipsAndTricksList = [
    "Recommended food",
    "Human foods that are toxic",
    "Common diseases and symptoms",
    "What to do if your pet goes missing",
    "First aid tips",
    "Pet insurance info",
    "Daily activity needs",
    "Obedience training basics"
  ];

  //for get header
  @override
  void initState() {
    //for get header and details
    for (var i = 0; i < tipsAndTricksList.length; i++) {
      for (var map in TipsAndTricksForYourPetsPageData.informationTopics) {
        if (map.containsKey(tipsAndTricksList[i])) {
          final data = map[tipsAndTricksList[i]]!;
          headers.add(data.keys.first);

          break;
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //photos that i used it
    final List<String> tipsAndTricksPhotos = [
      Assets.imagesRecommendedFood,
      Assets.imagesHumanFoodsThatAreToxic,
      Assets.imagesCommonDiseasesAndSymptoms,
      Assets.imagesWhattToDoIfYourPetGoesMissing,
      Assets.imagesFirstAidTips,
      Assets.imagesPetInsuranceInfo,
      Assets.imagesDailyActivityNeeds,
      Assets.imagesObedienceTrainingBasics,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Tips & Tricks",
          style: AppStyles.urbanistMedium16(context),
        ),
        const SizedBox(height: 10),
        SizedBox(
            height: 170,
            child: ListView.builder(
              itemCount: tipsAndTricksList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed("/informationpage",
                        arguments: tipsAndTricksList[index]);
                  },
                  child: Container(
                    width: 160,
                    height: 160,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: ColorsApp.primaryColorOpicaty,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              tipsAndTricksPhotos[index],
                              width: 140,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              headers[index],
                              style: AppStyles.urbanistMedium14(context),
                              maxLines: 3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}
