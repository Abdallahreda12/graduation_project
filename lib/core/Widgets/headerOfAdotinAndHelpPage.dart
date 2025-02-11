import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/styles.dart';

class TextAndBackArrowHeader extends StatelessWidget {
  const TextAndBackArrowHeader(
      {super.key, required this.texts, required this.colorsOfTexts});

  final List<String> texts;
  final List<Color> colorsOfTexts;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: texts.asMap().entries.map(
              (e) {
                int index = e.key;
                var item = e.value;
                return Text(
                  item,
                  style: AppStyles.urbanistSemiBold18(context)
                      .copyWith(color: colorsOfTexts[index]),
                );
              },
            ).toList()),
      ],
    );
  }
}
