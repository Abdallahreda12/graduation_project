import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/controller/profileController.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:intl/intl.dart';

class DateOfBirthTextFieldInProfilePage extends StatefulWidget {
  final String label;
  final String? initValue;

  const DateOfBirthTextFieldInProfilePage({
    required this.label,
    required this.initValue,
  });

  @override
  _DateOfBirthTextFieldInProfilePageState createState() =>
      _DateOfBirthTextFieldInProfilePageState();
}

class _DateOfBirthTextFieldInProfilePageState
    extends State<DateOfBirthTextFieldInProfilePage> {
  IconData icon = Icons.edit_sharp;
  late TextEditingController _controller;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.initValue);
  }

  void toggleEdit(ProfileControllerImp controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
      _controller.text = formattedDate;
      controller.user.usersDateOfBirth = formattedDate;

      controller.editProfile();
      print("done");
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
            borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          controller: _controller,
          readOnly: true,
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
