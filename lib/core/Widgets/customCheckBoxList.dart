import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class CustomCheckListTile extends StatefulWidget {
  const CustomCheckListTile({
    super.key,
    required this.options,
    required this.question,
    required this.onDataChanged,
    this.activeColor = ColorsApp.primaryColor,
    this.defualtAnswer = "",
  });

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
  bool showError = false;

  @override
  void initState() {
    super.initState();
    answer = widget.defualtAnswer;
  }

  bool isValid() {
    final valid = answer.isNotEmpty;
    setState(() {
      showError = !valid;
    });
    return valid;
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
          const SizedBox(height: 5),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: widget.options.map((e) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors.grey,
                      checkboxTheme: const CheckboxThemeData(
                        shape: CircleBorder(),
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
                          showError = false;
                          widget.onDataChanged(answer);
                        });
                      },
                    ),
                  ),
                  Text(
                    e,
                    style: AppStyles.urbanistMedium14(context),
                  )
                ],
              );
            }).toList(),
          ),
          if (showError)
            const Padding(
              padding: EdgeInsets.only(top: 5, left: 4),
              child: Text(
                "This field is required",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
