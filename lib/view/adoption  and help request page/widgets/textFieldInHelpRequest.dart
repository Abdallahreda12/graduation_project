import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:intl/intl.dart';

class TextFiedsInHelpRequest extends StatefulWidget {
  const TextFiedsInHelpRequest({super.key});

  @override
  State<TextFiedsInHelpRequest> createState() => _TextFiedsInHelpRequestState();
}

class _TextFiedsInHelpRequestState extends State<TextFiedsInHelpRequest> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();
    DateTime? selectedDate;
    return Column(
      children: [
        CustomTextField(
          onDataChanged: (p0) {},
          text: "Title*",
          hintText: "Please specify the case type clearly.",
          validator: (value) => value!.isEmpty ? "title is required" : null,
          hintMaxLines: 1,
          maxLine: 1,
          borderColor: ColorsApp.secondaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          onDataChanged: (p0) {},
          text: "Description*",
          hintText: "Descripe the case",
          validator: (value) =>
              value!.isEmpty ? "Description is required" : null,
          hintMaxLines: 2,
          maxLine: 2,
          borderColor: ColorsApp.secondaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: AppStyles.urbanistMedium14(context),
            ),
            TextFormField(
              controller: dateController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "What’s the date when you found",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsApp.secondaryColor),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                ),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                    dateController.text =
                        DateFormat('yyyy-MM-dd').format(selectedDate!);
                    //widget.onDatePicked(selectedDate!);
                  });
                }
              },
              validator: (value) =>
                  value == null || value.isEmpty ? "Please select Date " : null,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          onDataChanged: (p0) {},
          text: "Location Link*",
          hintText: "Location of the case",
          validator: (value) =>
              value!.isEmpty ? "Location link is required" : null,
          hintMaxLines: 1,
          borderColor: ColorsApp.secondaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          onDataChanged: (p0) {},
          text: "Contact Info",
          hintText: "Your phone Number",
          validator: (value) {
            return null;
          },
          hintMaxLines: 1,
          borderColor: ColorsApp.secondaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          onDataChanged: (p0) {},
          text: "Socail Media Link*",
          hintText: "Your social media link",
          validator: (value) {
            return null;
          },
          hintMaxLines: 1,
          borderColor: ColorsApp.secondaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload Photos",
                style: AppStyles.urbanistMedium14(context),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 100,
                  height: 100,
                  decoration:
                      BoxDecoration(color: ColorsApp.secondaryColorOpicaty),
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: ColorsApp.secondaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
