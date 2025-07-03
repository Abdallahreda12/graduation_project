import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/styles.dart';

class TextAndBackArrowHeader extends StatelessWidget {
  const TextAndBackArrowHeader(
      {super.key,
      required this.texts,
      this.onTap,
      required this.colorsOfTexts});

  final List<String> texts;
  final List<Color> colorsOfTexts;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: onTap ?? () => Get.back(),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        Expanded(
          flex: 15,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: texts.asMap().entries.map(
                (e) {
                  int index = e.key;
                  var item = e.value;
                  return Flexible(
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.urbanistSemiBold18(context)
                          .copyWith(color: colorsOfTexts[index]),
                    ),
                  );
                },
              ).toList()),
        ),
      ],
    );
  }
}
