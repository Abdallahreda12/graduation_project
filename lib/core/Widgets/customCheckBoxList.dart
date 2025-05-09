import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class CustomCheckListTile extends StatefulWidget {
  const CustomCheckListTile(
      {super.key,
      required this.options,
      required this.question,
      required this.onDataChanged,
      this.activeColor = ColorsApp.primaryColor,
      this.defualtAnswer = ""});
  final List<String> options;
  final String question;
  final Function(String) onDataChanged;
  final Color activeColor;
  final String defualtAnswer;

  @override
  State<CustomCheckListTile> createState() => _CustomCheckListTileState();
}

class _CustomCheckListTileState extends State<CustomCheckListTile> {
  late String answer;
  @override
  void initState() {
    super.initState();
    answer = widget.defualtAnswer;
  }

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
          children: widget.options.map(
            (e) {
              return Row(
                children: [
                  Checkbox(
                    activeColor: widget.activeColor,
                    value: answer == e,
                    onChanged: (value) {
                      setState(
                        () {
                          answer == e ? answer = "" : answer = e;
                          widget.onDataChanged(answer);
                        },
                      );
                    },
                  ),
                  Text(
                    e,
                    style: AppStyles.urbanistMedium14(context),
                  )
                ],
              );
              //another version from checklist
              // return CheckboxListTile(
              //   activeColor: ColorsApp.primaryColor,
              //   dense: true,
              //   visualDensity: VisualDensity(vertical: -2),
              //   title: Text(
              //     e,
              //     style: AppStyles.urbanistMedium14(context),
              //   ),
              //   value: answer == e,
              //   onChanged: (value) {
              //     setState(
              //       () {
              //         answer == e ? answer = "" : answer = e;
              //         widget.onDataChanged(answer);
              //       },
              //     );
              //   },
              // );
            },
          ).toList(),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
