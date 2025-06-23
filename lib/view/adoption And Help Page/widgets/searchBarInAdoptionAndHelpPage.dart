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

        // shows a menu when clicking filter icon
        suffixIcon: PopupMenuButton<String>(
          icon: Icon(Icons.filter_list),
          onSelected: (value) {
            // Handle selection logic here
            if (value == 'adoption') {
              // filter for adoption
              print('Adoption selected');
            } else if (value == 'help') {
              // filter for help
              print('Help selected');
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'adoption',
              child: Text('Adoption'),
            ),
            PopupMenuItem(
              value: 'help',
              child: Text('Help'),
            ),
          ],
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
