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
        _buildPage(context),
        _buildPage(context),
        _buildPage(context),
      ],
    );
  }

  Widget _buildPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                'Welcome to Animal Assistance & Adoption\n\n'
                'Help stray animals by adopting or offering support. '
                'Upload photos, share details, and connect with the community '
                'to make a difference.\n\nJoin us today and help animals.',
                style: AppStyles.urbanistItalic18(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
