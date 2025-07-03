import 'package:cached_network_image/cached_network_image.dart';
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
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: typeOfCard == "Help"
                  ? ColorsApp.secondaryColor.withAlpha(51)
                  : ColorsApp.primaryColor.withAlpha(51)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: image, // make sure this is a full URL
                      width: double.infinity,
                      height: 125,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      placeholder: (context, url) => Container(
                        width: double.infinity,
                        height: 125,
                        color: Colors.grey.shade200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: double.infinity,
                        height: 125,
                        color: Colors.grey.shade300,
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey.shade700,
                          size: 40,
                        ),
                      ),
                    )),
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
                          color: typeOfCard == "Help"
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
      ),
    );
  }
}
