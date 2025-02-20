import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class EmptyNotifaction extends StatelessWidget {
  const EmptyNotifaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorsApp.primaryColorOpicaty),
            child: Icon(
              Icons.notifications_off_outlined,
              size: 55,
              color: ColorsApp.primaryColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Empty Notification",
            style: AppStyles.urbanistMedium14(context),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "There are no new notifications at the moment.",
            style: AppStyles.urbanistReqular12(context),
          )
        ],
      ),
    );
  }
}
