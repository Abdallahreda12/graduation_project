import 'package:flutter/material.dart';
import 'package:graduation_project/view/tips%20and%20tricks%20pages/TipsAndTricksPage/widgets/TipsAndTricksCardInTipsandTricksForYourPetPage.dart';

class PageViewInTipsAndTricksForYourPetsPage extends StatelessWidget {
  const PageViewInTipsAndTricksForYourPetsPage(
      {super.key, required this.cardDetials});
  final List<Map<String, String>> cardDetials;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cardDetials.length,
      itemBuilder: (context, index) {
        final item = cardDetials[index];
        final key = item.keys.first;
        final value = item[key]!;
        return TipsAndTricksCardInTipsandTricksForYourPetPage(
            title: key, description: value);
      },
    );
  }
}
