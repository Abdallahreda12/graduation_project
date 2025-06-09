import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';

class SearchbarInMainBookPage extends StatelessWidget {
  const SearchbarInMainBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
            color: ColorsApp.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsApp.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: ColorsApp.primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(width: 2),
        ),
        hintText: "Search",
      ),
    );
  }
}
