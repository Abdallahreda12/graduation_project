import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/styles.dart';

class PersonalCard extends StatelessWidget {
  const PersonalCard(
      {super.key, required this.image, required this.name, required this.des});

  final String image;
  final String name;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffC6C6C6)),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      image,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppStyles.urbanistSemiBold12(context),
                        ),
                        Text(
                          des,
                          style: AppStyles.urbanistReqular12(context)
                              .copyWith(color: Color(0xff999999)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff717171)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Icon(
                        Icons.phone_outlined,
                        color: Color(0xff717171),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff717171)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Icon(
                        Icons.message_outlined,
                        color: Color(0xff717171),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
