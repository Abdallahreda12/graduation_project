import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/controller/profileController.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class PhoneNumberAndLocationTextField extends StatefulWidget {
  final String label;
  final String? initValue;
  final TextInputType keyboardType;
  final Function(String)? onChanged; // 👈 Add this line

  const PhoneNumberAndLocationTextField({
    required this.label,
    required this.initValue,
    this.keyboardType = TextInputType.name,
    this.onChanged,
  });

  @override
  _PhoneNumberAndLocationTextFieldState createState() =>
      _PhoneNumberAndLocationTextFieldState();
}

class _PhoneNumberAndLocationTextFieldState
    extends State<PhoneNumberAndLocationTextField> {
  bool isReadOnly = true;
  IconData icon = Icons.edit_sharp;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initValue);
  }

  void toggleEdit(ProfileControllerImp contrller) {
    setState(() {
      isReadOnly = !isReadOnly;
      icon = isReadOnly ? Icons.edit_sharp : Icons.check;
    });
    if (icon == Icons.edit_sharp) {
      print(
          "doneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      contrller.editProfile();
    }
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          textAlignVertical: TextAlignVertical.center,
          controller: _controller,
          readOnly: isReadOnly,
          cursorColor: ColorsApp.primaryColor,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () => toggleEdit(controller), child: Icon(icon)),
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
          ),
        ),
      ),
    ]);
  }
}
