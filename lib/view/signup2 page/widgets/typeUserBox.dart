import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class TypeUserBox extends StatefulWidget {
  const TypeUserBox({
    super.key,
    required this.onDataChanged,
    required this.text,
    required this.icon,
    this.isSelected = false,
  });

  final Function(String) onDataChanged;
  final String text;
  final String icon;
  final bool isSelected;

  @override
  State<TypeUserBox> createState() => _TypeUserBoxState();
}

class _TypeUserBoxState extends State<TypeUserBox> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.95);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onDataChanged(widget.text);
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: ColorsApp.backGroundColor,
            borderRadius: BorderRadius.circular(120),
            border: widget.isSelected
                ? Border.all(
                    color: ColorsApp.primaryColor, // highlight color
                    width: 3.0,
                  )
                : null,
            boxShadow: widget.isSelected
                ? null
                : [
                    BoxShadow(
                      color: Colors.grey.withAlpha(120),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(widget.icon),
              Text(
                widget.text,
                style: AppStyles.urbanistMedium22(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
