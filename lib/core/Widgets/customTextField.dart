import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.onDataChanged,
    required this.text,
    required this.hintText,
    this.borderradius = 0,
    required this.validator,
    this.hintMaxLines = 1,
    this.maxLine = 1,
    this.borderColor = ColorsApp.primaryColor,
    this.readOnly = false,
    this.initValue = "",
    this.controller,
  });

  final Function(String) onDataChanged;
  final FormFieldValidator<String>? validator;
  final String text;
  final String hintText;
  final double borderradius;
  final int hintMaxLines;
  final int maxLine;
  final Color borderColor;
  final bool readOnly;
  final String initValue;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initValue);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose(); // Only dispose if we created it
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: AppStyles.urbanistMedium14(context),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: _controller,
          readOnly: widget.readOnly,
          maxLines: widget.maxLine,
          validator: widget.validator,
          onChanged: widget.onDataChanged,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderradius),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderradius),
              borderSide: const BorderSide(width: 2),
            ),
            hintText: widget.hintText,
            hintMaxLines: widget.hintMaxLines,
          ),
        ),
      ],
    );
  }
}
