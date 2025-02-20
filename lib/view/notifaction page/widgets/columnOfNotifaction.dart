import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class ColumnOfNotifaction extends StatelessWidget {
  const ColumnOfNotifaction({super.key, required this.notiList});
  final List<Map<String, dynamic>> notiList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: notiList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: ColorsApp.primaryColorOpicaty),
                  child: Icon(
                    notiList[index]["icon"],
                    color: ColorsApp.primaryColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    notiList[index]["message"],
                    style: AppStyles.urbanistReqular14(context),
                    softWrap: true,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
