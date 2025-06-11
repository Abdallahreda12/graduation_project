import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class TipsAndTricksCardInTipsandTricksForYourPetPage extends StatelessWidget {
  const TipsAndTricksCardInTipsandTricksForYourPetPage(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Get.toNamed("/tipsandtricksforyourpetspage");
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: MediaQuery.sizeOf(context).width * 0.90, // Slightly smaller
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorsApp.secondaryColor,
              ColorsApp.primaryColor,
              Colors.white.withAlpha(102),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.urbanistSemiBold16(context)),
                  SizedBox(height: 4),
                  Text(description,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.urbanistReqular12(context)),
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorsApp.primaryColor,
              ),
              child: Icon(
                Icons.arrow_forward,
                size: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

