import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customLoadingIndicator.dart';


class HandleLoadingIndicator extends StatelessWidget {
  const HandleLoadingIndicator({
    super.key,
    required this.isLoading,
    required this.widget,
  });

  final bool isLoading;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Stack(
        children: [
          AbsorbPointer(child: widget),
          Center(child: CustomLoadingIndicator()),
        ],
      );
    } else {
      return widget;
    }
  }
}
