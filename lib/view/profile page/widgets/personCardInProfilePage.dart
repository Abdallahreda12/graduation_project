import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/styles.dart';

class PersonCardInProfilePage extends StatelessWidget {
  const PersonCardInProfilePage(
      {super.key,
      required this.image,
      required this.name,
      required this.gmail});
  final String image;
  final String name;
  final String gmail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(image, width: 65, height: 65, fit: BoxFit.cover),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppStyles.urbanistMedium16(context),
              ),
              Text(
                gmail,
                style: AppStyles.urbanistReqular16(context)
                    .copyWith(color: Color(0xff999999)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
