import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class GenderTextFieldInProfilePage extends StatefulWidget {
  final String label;
  final String initValue;

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
  IconData icon = Icons.edit_sharp;
  late TextEditingController _controller;
  DateTime? selectedDate;
  String selectedGender = 'None';

  void _showPopupMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final buttonPosition =
        button.localToGlobal(Offset.zero); 
    final buttonSize = button.size;

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx + buttonSize.width, // Left position 
        buttonPosition.dy + buttonSize.height, // Top position 
        buttonPosition.dx, // Right position 
        buttonPosition.dy + buttonSize.height, // Bottom 
      ),
      items: [
        PopupMenuItem<String>(
          value: 'Male',
          child: Text('Male'),
        ),
        PopupMenuItem<String>(
          value: 'Female',
          child: Text('Female'),
        ),
      ],
    );

    if (selected != null) {
      setState(() {
        selectedGender = selected;
        _controller = TextEditingController(text: selectedGender);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initValue);
  }

  @override
  Widget build(BuildContext context) {
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
              onTap: () {
                _showPopupMenu(context);
              },
              child: Icon(icon),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
          ),
        ),
      ),
    ]);
  }
}
