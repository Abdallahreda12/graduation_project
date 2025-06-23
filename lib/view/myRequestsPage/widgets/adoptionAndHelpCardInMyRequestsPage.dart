import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class AdoptionAndHelpCardInMyRequestsPage extends StatelessWidget {
  const AdoptionAndHelpCardInMyRequestsPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.typeOfCard,
      required this.contact,
      required this.onTap});

  final String image;
  final String title;
  final String subtitle;
  final String typeOfCard;
  final String contact;
  final VoidCallback onTap;

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
            //
            //photo
            //
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image,
                        width: double.infinity,
                        height: 125,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: 125,
                            color: Colors.grey.shade300,
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.grey.shade700,
                              size: 40,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: typeOfCard == "adoption"
                          ? ColorsApp.primaryColor
                          : ColorsApp.secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Posted",
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.urbanistReqular16(context)
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //
            //reqest's details
            //
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
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: typeOfCard == "adoption"
                      ? ColorsApp.primaryColor
                      : ColorsApp.secondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("View Details",
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.urbanistReqular16(context)
                            .copyWith(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
