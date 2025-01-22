import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graduation_project/core/util/colors.dart';

class CustomLoadingIndication extends StatelessWidget {
  const CustomLoadingIndication({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        itemBuilder: (context, index) {
          return Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                color: ColorsApp.primaryColor,
                borderRadius: BorderRadius.circular(20)),
          );
        },
      ),
    );
  }
}
