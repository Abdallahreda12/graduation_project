import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class BuildDropdownRow extends StatelessWidget {
  const BuildDropdownRow(
      {super.key,
      required this.context,
      required this.label,
      required this.selectedValue,
      required this.options,
      required this.onChanged,
      this.mainAxisAlign = MainAxisAlignment.spaceBetween,
      this.spaceBetweenRowAndLabel = 0,
      this.sizeBetweenIconAndSelectedValue = 5,
      this.isShowSelcetedValue = true});
  final BuildContext context;
  final String label;
  final double spaceBetweenRowAndLabel;
  final MainAxisAlignment mainAxisAlign;
  final String selectedValue;
  final double sizeBetweenIconAndSelectedValue;
  final bool isShowSelcetedValue;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlign,
      children: [
        Text(
          label,
          style: AppStyles.urbanistReqular14(context),
        ),
        SizedBox(
          width: spaceBetweenRowAndLabel,
        ),
        DropdownButton<String>(
          menuWidth: MediaQuery.sizeOf(context).width * 0.5,
          dropdownColor: ColorsApp.backGroundColor,
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          iconSize: 28,
          value: isShowSelcetedValue ? selectedValue : null,
          underline: const SizedBox(), // to remove underline
          onChanged: onChanged,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: AppStyles.urbanistReqular12(context),
              ),
            );
          }).toList(),
          selectedItemBuilder: (BuildContext context) {
            return options.map<Widget>((String item) {
              return isShowSelcetedValue
                  ? Row(
                      children: [
                        Text(
                          item,
                          style: AppStyles.urbanistReqular12(context),
                        ),
                        SizedBox(
                            width:
                                sizeBetweenIconAndSelectedValue), // space between text and icon
                      ],
                    )
                  : const SizedBox.shrink(); // Hides the selected value;
            }).toList();
          },
        )
      ],
    );
  }
}
