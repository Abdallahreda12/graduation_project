import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/view/notifaction%20page/widgets/columnOfNotifaction.dart';
import 'package:graduation_project/view/notifaction%20page/widgets/emptyNotifaction.dart';

class NotifactionPage extends StatelessWidget {
  const NotifactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notiList = [
      {
        'message': "Your adoption request has been successfully published.",
        "icon": Icons.done
      },
      {
        'message': "You have 10 unread messages. Please check your inbox.",
        "icon": Icons.message
      },
      {
        'message': "Your adoption request has been successfully published.",
        "icon": Icons.done
      },
      {
        'message': "You have 10 unread messages. Please check your inbox.",
        "icon": Icons.message
      },
    ];

    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: Stack(children: [
        Positioned.fill(
          child: SvgPicture.asset(
            Assets.imagesLogoInverse,
            fit: BoxFit.none,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
          child: Column(
            children: [
              //
              //header of page
              //
              TextAndBackArrowHeader(
                  texts: ["Notifactions"], colorsOfTexts: [Colors.black]),
              SizedBox(
                height: 25,
              ),
              //
              //check the List of noti first,then build appropaite page
              //
              notiList.isEmpty
                  ? EmptyNotifaction()
                  : ColumnOfNotifaction(notiList: notiList)
            ],
          ),
        ),
      ]),
    );
  }
}
