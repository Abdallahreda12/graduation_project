import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/profileController.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class GenderTextFieldInProfilePage extends StatefulWidget {
  final String label;
  final String? initValue;

  const GenderTextFieldInProfilePage({
    required this.label,
    required this.initValue,
  });

  @override
  _GenderTextFieldInProfilePageState createState() =>
      _GenderTextFieldInProfilePageState();
}

class _GenderTextFieldInProfilePageState
    extends State<GenderTextFieldInProfilePage> {
  final controller = Get.find<ProfileControllerImp>();

  @override
  void initState() {
    super.initState();
    controller.textEditingController =
        TextEditingController(text: widget.initValue);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileControllerImp>();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          widget.label,
          style: AppStyles.urbanistReqular12(context)
              .copyWith(color: Color(0xff6a6a6a)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: ColorsApp.primaryColorOpicaty,
            borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          controller: controller.textEditingController,
          readOnly: true,
          cursorColor: ColorsApp.primaryColor,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                controller.showPopupMenu(context);
              },
              child: Icon(controller.icon),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
          ),
        ),
      ),
    ]);
  }
}
