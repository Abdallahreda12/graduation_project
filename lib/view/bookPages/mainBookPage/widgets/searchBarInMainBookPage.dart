import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';

class SearchbarInMainBookPage extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onClear;

  const SearchbarInMainBookPage({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: controller.text.isEmpty
            ? GestureDetector(
                onTap: () {
                  // Focus on the text field when search icon is tapped
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Icon(
                  Icons.search,
                  color: ColorsApp.primaryColor,
                ),
              )
            : GestureDetector(
                onTap: onClear,
                child: Icon(
                  Icons.clear,
                  color: ColorsApp.primaryColor,
                ),
              ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsApp.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsApp.primaryColor, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 2),
        ),
        hintText: "Search doctors or specializations...",
        prefixIcon: Icon(
          Icons.search,
          color: ColorsApp.primaryColor,
        ),
      ),
    );
  }
}