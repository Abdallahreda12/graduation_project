import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.message = "Loading..."});

  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(110, 0, 0, 0),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorsApp.primaryColor),
            ),
            SizedBox(height: 16),
            // Use Text(message) if you want dynamic message
          ],
        ),
      ),
    );
  }
}
