import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/select%20lang%20page/widgets/buttonsInSelectedLang.dart';

class SelectLangPage extends StatelessWidget {
  const SelectLangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesLogo),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "help",
                  style: AppStyles.sansReqular48(context),
                ),
                Text(
                  ' animal',
                  style: AppStyles.sansReqular48(context)
                      .copyWith(color: ColorsApp.primaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Select language",
              style: AppStyles.urbanistReqular32(context),
            ),
            SizedBox(
              height: 15,
            ),
            ButtonsInSelectedLang()
          ],
        ),
      ),
    );
  }
}
