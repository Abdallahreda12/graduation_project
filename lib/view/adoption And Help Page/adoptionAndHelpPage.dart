import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/api_links.dart';
import 'package:graduation_project/controller/HomePageController.dart';
import 'package:graduation_project/core/Widgets/customBottomAppBar.dart';
import 'package:graduation_project/core/Widgets/customPlusBottunInAppBar.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/data/models/adoptionModel.dart';
import 'package:graduation_project/data/models/helpModel.dart';
import 'package:graduation_project/view/adoption%20And%20Help%20Page/widgets/adoptionAndHelpCard.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/view/adoption%20And%20Help%20Page/widgets/searchBarInAdoptionAndHelpPage.dart';

class AdoptionAndHelpPage extends StatefulWidget {
  const AdoptionAndHelpPage({super.key});

  @override
  State<AdoptionAndHelpPage> createState() => _AdoptionAndHelpPageState();
}

class _AdoptionAndHelpPageState extends State<AdoptionAndHelpPage> {
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
    //when api for this page do , instead this controller by the controller of the adoptionAndHelpRequest
    final HomePageControllerImp controller = Get.find<HomePageControllerImp>();
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      resizeToAvoidBottomInset: false,
      //plusIcon in the bottmAppBar
      floatingActionButton: CustomPlusBottunInAppBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      //CustomBottomAppBar
      bottomNavigationBar: CustomBottomAppBar(
        currentPageIndex: 1,
      ),
      body: //GetBuilder<HomePageControllerImp>(
          //builder: (controller) =>
          Stack(children: [
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
                texts: ["adoption", " & ", "help"],
                colorsOfTexts: [
                  ColorsApp.primaryColor,
                  Colors.black,
                  ColorsApp.secondaryColor
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
              //
              Expanded(
                child: ListView.builder(
                  itemCount: controller.mergedItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.mergedItems[index];

                    return item.type == 'adoption'
                        ? AdoptionAndHelpCard(
                            image:
                                '$linkServerImage${(item.data as AdoptionModel).photoUrl}',
                            title: (item.data as AdoptionModel).title,
                            subtitle: (item.data as AdoptionModel).description,
                            typeOfCard: 'Adoption',
                            contact: (item.data as AdoptionModel).phone,
                            onTap: () {
                              Get.toNamed("/adoptiondetailspage",
                                  arguments: item);
                            },
                          )
                        : AdoptionAndHelpCard(
                            image:
                                '$linkServerImage${(item.data as HelpRequestModel).photoUrl}',
                            title: (item.data as HelpRequestModel).title,
                            subtitle:
                                (item.data as HelpRequestModel).description,
                            typeOfCard: 'Help',
                            contact: (item.data as HelpRequestModel).phone,
                            onTap: () {
                              Get.toNamed("/helpdetailspage", arguments: item);
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
    //);
  }
}
