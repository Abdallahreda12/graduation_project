import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customBottomAppBar.dart';
import 'package:graduation_project/core/Widgets/customPlusBottunInAppBar.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/view/adoptionAndHelpPage/widgets/adoptionAndHelpCard.dart';

class AdoptionAndHelpPage extends StatelessWidget {
  const AdoptionAndHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
