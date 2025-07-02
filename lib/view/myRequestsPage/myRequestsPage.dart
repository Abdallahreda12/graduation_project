import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/ViewMyRequestsController.dart';
import 'package:graduation_project/core/class/handleWidgets.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/data/models/adoptionModel.dart';
import 'package:graduation_project/data/models/helpModel.dart';
import 'package:graduation_project/view/adoption%20And%20Help%20Page/widgets/searchBarInAdoptionAndHelpPage.dart';
import 'package:graduation_project/view/myRequestsPage/widgets/adoptionAndHelpCardInMyRequestsPage.dart';

class MyRequestsPage extends StatefulWidget {
  const MyRequestsPage({super.key});

  @override
  State<MyRequestsPage> createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage> {
  ////// all this comment maybe need it when make logic for SearchBar
  //
  // TextEditingController _searchController = TextEditingController();

  // List<String> allItems = [
  //   "Apple",
  //   "Banana",
  //   "Bbanana",
  //   "Cherry",
  //   "Date",
  //   "Balala",
  //   "Fig",
  //   "Grape"
  // ];

  // List<String> filteredItems = [];

  // @override
  // void initState() {
  //   super.initState();
  //   filteredItems = allItems;
  // }

  // void _filterSearch(String query) {
  //   List<String> tempList = [];
  //   if (query.isNotEmpty) {
  //     tempList = allItems
  //         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   } else {
  //     tempList = allItems;
  //   }
  //   setState(() {
  //     filteredItems = tempList;
  //     for (var i = 0; i < 1; i++) {
  //       print(filteredItems[i]);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Get.put(ViewMyRequestsControllerImp());
    return Scaffold(
        backgroundColor: ColorsApp.backGroundColor,
        resizeToAvoidBottomInset: false,
        body: GetBuilder<ViewMyRequestsControllerImp>(
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
                padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
                child: Column(
                  children: [
                    //
                    //Header of page
                    //
                    TextAndBackArrowHeader(
                      texts: ["My Requests"],
                      colorsOfTexts: [
                        ColorsApp.primaryColor,
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //
                    //SaerchBar
                    //
                    SearchbarInAdoptionAndHelpPage(),
                    SizedBox(
                      height: 10,
                    ),
                    //
                    //cards
                    //(item.data as AdoptionModel).photoUrl
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.mergedItems.length,
                        itemBuilder: (context, index) {
                          final item = controller.mergedItems[index];

                          return item.type == "adoption"
                              ? AdoptionAndHelpCardInMyRequestsPage(
                                  image:
                                      'https://myphpapp-e4fjcnf2azfsazh8.uaenorth-01.azurewebsites.net/upload/${(item.data as AdoptionModel).photoUrl}',
                                  title: (item.data as AdoptionModel).title,
                                  subtitle:
                                      (item.data as AdoptionModel).description,
                                  typeOfCard: 'adoption',
                                  contact: (item.data as AdoptionModel).phone,
                                  onTap: () {
                                    //handle this to navigate you to specific page for AdoptionDetailsPage or helpDetailsPage
                                    Get.toNamed(
                                        "/adoptiondetailspageWithDeleteButton",arguments: item);
                                  },
                                )
                              : AdoptionAndHelpCardInMyRequestsPage(
                                  image:
                                      '$linkServerImage${(item.data as HelpRequestModel).photoUrl}',
                                  title: (item.data as HelpRequestModel).title,
                                  subtitle: (item.data as HelpRequestModel)
                                      .description,
                                  typeOfCard: 'help',
                                  contact:
                                      (item.data as HelpRequestModel).phone,
                                  onTap: () {
                                    //handle this to navigate you to specific page for AdoptionDetailsPage or helpDetailsPage
                                    Get.toNamed(
                                        "/helpdetailspageWithDeleteButton",
                                        arguments: item);
                                  },
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
