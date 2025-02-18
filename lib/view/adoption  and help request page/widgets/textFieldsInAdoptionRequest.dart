import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customCheckBoxList.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class TextFieldsInAdoptionRequest extends StatefulWidget {
  const TextFieldsInAdoptionRequest({super.key});

  @override
  State<TextFieldsInAdoptionRequest> createState() =>
      _TextFieldsInAdoptionRequestState();
}

class _TextFieldsInAdoptionRequestState
    extends State<TextFieldsInAdoptionRequest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          onDataChanged: (p0) {},
          text: "Type*",
          hintText: "Type of pet",
          validator: (value) =>
              value!.isEmpty ? "determine type of pet is required" : null,
          hintMaxLines: 1,
          maxLine: 1,
          borderColor: ColorsApp.primaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          onDataChanged: (p0) {},
          text: "Title*",
          hintText: "Please be clearly",
          validator: (value) => value!.isEmpty ? "title is required" : null,
          hintMaxLines: 1,
          maxLine: 1,
          borderColor: ColorsApp.primaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          onDataChanged: (p0) {},
          text: "Description*",
          hintText:
              "Please describe your pet (e.g., Color, Size, Gender,Distinctive markings)",
          validator: (value) =>
              value!.isEmpty ? "Description is required" : null,
          hintMaxLines: 2,
          maxLine: 2,
          borderColor: ColorsApp.primaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        CustomCheckListTile(
          options: ["Male", "Female"],
          question: "Gender",
          onDataChanged: (p0) {},
        ),
        CustomCheckListTile(
          options: ["Small", "Medium", "Big", "Don't know"],
          question: "Size",
          onDataChanged: (p0) {},
        ),
        CustomTextField(
          onDataChanged: (p0) {},
          text: "Age",
          hintText: "Pet's age",
          validator: (value) {
            return null;
          },
          hintMaxLines: 1,
          borderColor: ColorsApp.primaryColor,
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          onDataChanged: (p0) {},
          text: "Location*",
          hintText: "Your location",
          validator: (value) =>
              value!.isEmpty ? "Location link is required" : null,
          hintMaxLines: 1,
          borderColor: ColorsApp.primaryColor,
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
          borderColor: ColorsApp.primaryColor,
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
                      BoxDecoration(color: ColorsApp.primaryColorOpicaty),
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: ColorsApp.primaryColor,
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
