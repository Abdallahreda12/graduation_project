import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
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
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
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
              //
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return index % 2 == 0
                        ? AdoptionAndHelpCardInMyRequestsPage(
                            image: Assets.imagesAnimalPhoto2,
                            title: 'Cat',
                            subtitle:
                                'Found hiding under a car in the parking lot of Smiths Grocery Store',
                            typeOfCard: 'help',
                            contact: 'contact:555-987-6543 to claim',
                            onTap: () {
                              //handle this to navigate you to specific page for AdoptionDetailsPage or helpDetailsPage
                              Get.toNamed("/helpdetailspageWithDeleteButton");
                            },
                          )
                        : AdoptionAndHelpCardInMyRequestsPage(
                            image: Assets.imagesAnimalPhoto1,
                            title: 'Dog',
                            subtitle:
                                'Medium-sized golden retriever with a red collar, responds to the name "Buddy',
                            typeOfCard: 'adoption',
                            contact: 'contact:555-987-6543 to claim',
                            onTap: () {
                              //handle this to navigate you to specific page for AdoptionDetailsPage or helpDetailsPage
                              Get.toNamed(
                                  "/adoptiondetailspageWithDeleteButton");
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
  }
}
