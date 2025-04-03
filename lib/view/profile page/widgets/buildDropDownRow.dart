import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/styles.dart';

class BuildDropdownRow extends StatelessWidget {
  const BuildDropdownRow(
      {super.key,
      required this.context,
      required this.label,
      required this.selectedValue,
      required this.options,
      required this.onChanged});
  final BuildContext context;
  final String label;
  final String selectedValue;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppStyles.urbanistReqular14(context),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: DropdownButton<String>(
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            iconSize: 28,
            value: selectedValue,
            underline: const SizedBox(), //to remove underline
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
          ),
        ),
      ],
    );
  }
}
