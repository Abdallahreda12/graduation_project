import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/styles.dart';

class SelectTypeOfRequest extends StatefulWidget {
  const SelectTypeOfRequest(
      {super.key,
      required this.type,
      required this.onTap,
      required this.isSelected,
      required this.borderColor,
      required this.image,
      required this.textColor});

  final String type;
  final VoidCallback onTap;
  final bool isSelected;
  final Color borderColor;
  final String image;
  final Color textColor;
  @override
  State<SelectTypeOfRequest> createState() => _SelectTypeOfRequestState();
}

class _SelectTypeOfRequestState extends State<SelectTypeOfRequest> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: 2,
          right: 2,
          top: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: widget.isSelected
              ? Border.all(color: widget.borderColor, width: 2, strokeAlign: 1)
              : null,
        ),
        child: Container(
          width: (MediaQuery.sizeOf(context).width / 2) - 35,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              fit: BoxFit.fill,
              scale: 2,
              image: AssetImage(widget.image),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5, left: 5),
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(130),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.type,
                  style: AppStyles.urbanistSemiBold16(context)
                      .copyWith(color: widget.textColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
