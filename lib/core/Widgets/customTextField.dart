import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.onDataChanged,
      required this.text,
      required this.hintText,
      this.borderradius = 0,
      required this.validator});

  final Function(String) onDataChanged;
  final FormFieldValidator<String>? validator;
  final String text;
  final String hintText;
  final double borderradius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyles.urbanistMedium14(context),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: validator,
          onChanged: (value) {
            onDataChanged(value);
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderradius),
              borderSide: BorderSide(color: ColorsApp.primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderradius),
              borderSide: BorderSide(width: 2),
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
