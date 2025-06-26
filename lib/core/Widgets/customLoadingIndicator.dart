import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.message = "Loading..."});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(color: const Color.fromARGB(110, 0, 0, 0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorsApp.primaryColor),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: AppStyles.urbanistReqular14(context)
                .copyWith(color: ColorsApp.primaryColor),
          ),
        ],
      ),
    );
  }
}
