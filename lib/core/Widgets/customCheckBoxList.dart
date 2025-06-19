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
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: AppStyles.urbanistMedium16(context),
          ),
          SizedBox(height: 5),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: widget.options.map(
              (e) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor:
                              Colors.grey, // color when not selected
                          checkboxTheme: CheckboxThemeData(
                            shape: CircleBorder(), // 🔵 makes it circular
                          ),
                        ),
                        child: Radio<String>(
                          value: e,
                          groupValue: answer,
                          activeColor: widget.activeColor,
                          fillColor: WidgetStatePropertyAll(widget.activeColor),
                          onChanged: (value) {
                            setState(() {
                              answer = value!;
                              widget.onDataChanged(answer);
                            });
                          },
                        )),
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
      ),
    );
  }
}
