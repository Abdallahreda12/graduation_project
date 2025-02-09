import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customBottomAppBar.dart';
import 'package:graduation_project/core/Widgets/customPlusBottunInAppBar.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/view/adoptionAndHelpPage/widgets/adoptionAndHelpCard.dart';
import 'package:graduation_project/view/adoptionAndHelpPage/widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/view/adoptionAndHelpPage/widgets/searchBarInAdoptionAndHelpPage.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //plusIcon in the bottmAppBar
      floatingActionButton: CustomPlusBottunInAppBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      //CustomBottomAppBar
      bottomNavigationBar: CustomBottomAppBar(
        currentPageIndex: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
        child: Column(
          children: [
            //
            //Header of page
            //
            HeaderOfAdotinAndHelpPage(),
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
                  return AdoptionAndHelpCard(
                    image: Assets.imagesAnimalPhoto1,
                    title: 'Cat',
                    subtitle:
                        'Found hiding under a car in the parking lot of Smiths Grocery Store',
                    typeOfCard: 'adoption',
                    contact: 'contact:555-987-6543 to claim',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
