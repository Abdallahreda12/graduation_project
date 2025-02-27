import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class CustomCheckBoxMultiAnswer extends StatefulWidget {
  const CustomCheckBoxMultiAnswer(
      {super.key,
      required this.options,
      required this.question,
      required this.onDataChanged,
      this.activeColor = ColorsApp.primaryColor});
  final List<String> options;
  final String question;
  final Function(List<String> answersList) onDataChanged;
  final Color activeColor;

  @override
  State<CustomCheckBoxMultiAnswer> createState() =>
      _CustomCheckBoxMultiAnswerState();
}

class _CustomCheckBoxMultiAnswerState extends State<CustomCheckBoxMultiAnswer> {
  List<String> answer = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: AppStyles.urbanistMedium16(context),
        ),
        SizedBox(height: 5),
        Column(
          children: widget.options.asMap().entries.map(
            (e) {
              var item = e.value;
              return Row(
                children: [
                  Checkbox(
                    activeColor: widget.activeColor,
                    value: answer.contains(item),
                    onChanged: (value) {
                      setState(
                        () {
                          answer.contains(item)
                              ? answer.remove(item)
                              : answer.add(item);
                          widget.onDataChanged(answer);
                        },
                      );
                    },
                  ),
                  Text(
                    item,
                    style: AppStyles.urbanistMedium14(context),
                  )
                ],
              );
            },
          ).toList(),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
