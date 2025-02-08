import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class AdoptionAndHelpCard extends StatelessWidget {
  const AdoptionAndHelpCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.typeOfCard,
      required this.contact});

  final String image;
  final String title;
  final String subtitle;
  final String typeOfCard;
  final String contact;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: typeOfCard == "help"
                ? ColorsApp.secondaryColor.withAlpha(51)
                : ColorsApp.primaryColor.withAlpha(51)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 125,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.urbanistMedium14(context),
                  ),
                  Text(
                    subtitle,
                    style: AppStyles.urbanistReqular12(context),
                  ),
                  Text(
                    typeOfCard,
                    style: AppStyles.urbanistReqular12(context).copyWith(
                        color: typeOfCard == "help"
                            ? ColorsApp.secondaryColor
                            : ColorsApp.primaryColor),
                  ),
                  Text(
                    contact,
                    style: AppStyles.urbanistReqular14(context),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
