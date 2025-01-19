import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/styles.dart';

class Pageviewcontent extends StatelessWidget {
  const Pageviewcontent({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              'Welcome to Animal Assistance & Adoption\n\nHelp stray animals by adopting or offering support. Upload photos, share details, and connect with the community to make a difference.\n\nJoin us today and help animals',
              style: AppStyles.urbanistItalic18(context),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              'Welcome to Animal Assistance & Adoption\n\nHelp stray animals by adopting or offering support. Upload photos, share details, and connect with the community to make a difference.\n\nJoin us today and help animals',
              style: AppStyles.urbanistItalic18(context),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              'Welcome to Animal Assistance & Adoption\n\nHelp stray animals by adopting or offering support. Upload photos, share details, and connect with the community to make a difference.\n\nJoin us today and help animals',
              style: AppStyles.urbanistItalic18(context),
            ),
          ),
        ),
      ],
    );
  }
}
