import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class ResetOptionTile extends StatelessWidget {
  const ResetOptionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              boxShadow: isSelected
                  ? null
                  : [
                      BoxShadow(
                        color: Colors.grey.withAlpha(120), // Shadow color
                        spreadRadius: 3, // Spread of the shadow
                        blurRadius: 4, // Softness of the shadow
                        offset: Offset(0, 3), // Horizontal and vertical offset
                      ),
                    ],
              color: ColorsApp.backGroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30,
                    left: 20,
                  ),
                  child: Container(
                    width: 40, // width and height must be equal
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(
                          255, 255, 254, 254), // no fill color
                    ),
                    child: Icon(
                      icon, // choose any icon
                      size: 25, // adjust this value to control icon size
                      color: ColorsApp.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppStyles.urbanistMedium22(context),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(subtitle,
                          style: AppStyles.urbanistReqular14(context))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
