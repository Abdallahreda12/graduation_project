import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class ResetOptionTile extends StatefulWidget {
  const ResetOptionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<ResetOptionTile> createState() => _ResetOptionTileState();
}

class _ResetOptionTileState extends State<ResetOptionTile> {
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
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: ColorsApp.backGroundColor,
            borderRadius: BorderRadius.circular(10),
            border: widget.isSelected
                ? Border.all(
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: ColorsApp.primaryColor,
                    width: 2.5)
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 20),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 255, 254, 254),
                  ),
                  child: Icon(
                    widget.icon,
                    size: 25,
                    color: ColorsApp.primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppStyles.urbanistMedium22(context),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.subtitle,
                      style: AppStyles.urbanistReqular14(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
