import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/tips%20and%20tricks%20pages/Data/TipsAndTricksForYourPetsPageData.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  //title get to me from previous page
  late final String title;
  //will use these to extract header and details from list
  String? header;
  String? details;
  late List<String> links;

  //for get header and details
  @override
  void initState() {
    title = Get.arguments;
    //for get header and details
    for (var map in TipsAndTricksForYourPetsPageData.informationTopics) {
      if (map.containsKey(title)) {
        final data = map[title]!;
        header = data.keys.first;
        details = data.values.first;
        break;
      }
    }
    //for get links
    for (var map in TipsAndTricksForYourPetsPageData.informationTopicsLinks) {
      if (map.containsKey(title)) {
        final data = map[title]!;
        links = [data[0], data[1]];
        print(data[0]);
        break;
      }
    }
    super.initState();
  }

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
                  texts: [title], colorsOfTexts: [Colors.black]),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //
                      //header container
                      //
                      Container(
                        decoration: BoxDecoration(
                            color: ColorsApp.primaryColorOpicaty,
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        child: Text(
                          header!,
                          style: AppStyles.urbanistSemiBold18(context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //
                      //details container
                      //
                      Container(
                        decoration: BoxDecoration(
                            color: ColorsApp.primaryColorOpicaty,
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        child: Text(
                          details!,
                          style: AppStyles.urbanistMedium16(context),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //
                      //links container
                      //
                      Container(
                        decoration: BoxDecoration(
                            color: ColorsApp.primaryColorOpicaty,
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "More information",
                              style: AppStyles.urbanistMedium16(context),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            //
                            //linkes
                            //
                            Text.rich(
                              TextSpan(
                                style: AppStyles.urbanistMedium16(context),
                                children: [
                                  TextSpan(
                                    text: 'Click Here',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final url = Uri.parse(links[0]);
                                        if (!await launchUrl(url,
                                            mode: LaunchMode
                                                .externalApplication)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Could not launch $url')),
                                          );
                                        }
                                      },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text.rich(
                              TextSpan(
                                style: AppStyles.urbanistMedium16(context),
                                children: [
                                  TextSpan(
                                    text: 'or here',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final url = Uri.parse(links[1]);
                                        if (!await launchUrl(url,
                                            mode: LaunchMode
                                                .externalApplication)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Could not launch $url')),
                                          );
                                        }
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
