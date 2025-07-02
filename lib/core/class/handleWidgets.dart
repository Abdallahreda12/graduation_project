import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customLoadingIndicator.dart';
class HandleLoadingIndicator extends StatefulWidget {
  const HandleLoadingIndicator({
    super.key,
    required this.isLoading,
    required this.widget,
  });

  final bool isLoading;
  final Widget widget;

  @override
  State<HandleLoadingIndicator> createState() => _HandleLoadingIndicatorState();
}

class _HandleLoadingIndicatorState extends State<HandleLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.widget,
        if (widget.isLoading)
          Positioned.fill(
            child: AbsorbPointer(
              absorbing: true,
              child: const CustomLoadingIndicator(),
            ),
          ),
      ],
    );
  }
}
