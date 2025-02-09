import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';

class SearchbarInAdoptionAndHelpPage extends StatelessWidget {
  const SearchbarInAdoptionAndHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      decoration: InputDecoration(
        prefixIcon: GestureDetector(
          onTap: () {},
          child: Icon(Icons.search),
        ),
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Icon(Icons.filter_list),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: ColorsApp.primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(width: 2),
        ),
        hintText: "Search adoption & help Items...",
      ),
    );
  }
}
