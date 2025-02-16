import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/Widgets/customCheckBoxList.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/adoption%20%20and%20help%20request%20page/widgets/selectTypeOfRequest.dart';
import 'package:intl/intl.dart';

class AdoptionAndHelpRequestPage extends StatefulWidget {
  const AdoptionAndHelpRequestPage({super.key});

  @override
  State<AdoptionAndHelpRequestPage> createState() =>
      _AdoptionAndHelpRequestPageState();
}

class _AdoptionAndHelpRequestPageState
    extends State<AdoptionAndHelpRequestPage> {
  final TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  String selectedType = "help";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 27, right: 27, top: 35),
        child: Column(
          children: [
            TextAndBackArrowHeader(
              texts: ["Adoption", " & ", "help", " request"],
              colorsOfTexts: [
                ColorsApp.primaryColor,
                Colors.black,
                ColorsApp.secondaryColor,
                Colors.black
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SelectTypeOfRequest(
                          isSelected: selectedType == "help",
                          onTap: () {
                            setState(
                              () {
                                selectedType = "help";
                              },
                            );
                          },
                          type: "help",
                          borderColor: ColorsApp.secondaryColor,
                          image: Assets.imagesAnimalPhoto2,
                          textColor: ColorsApp.secondaryColor,
                        ),
                        SelectTypeOfRequest(
                            type: "adoption",
                            onTap: () {
                              setState(
                                () {
                                  selectedType = "adoption";
                                },
                              );
                            },
                            isSelected: selectedType == "adoption",
                            borderColor: ColorsApp.primaryColor,
                            image: Assets.imagesAnimalPhoto5,
                            textColor: ColorsApp.primaryColor)
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //
                    //request TextFeild
                    //
                    selectedType == "help"
                        //
                        //request for help
                        //
                        ? Column(
                            children: [
                              CustomTextField(
                                onDataChanged: (p0) {},
                                text: "Title*",
                                hintText:
                                    "Please specify the case type clearly.",
                                validator: (value) =>
                                    value!.isEmpty ? "title is required" : null,
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
                                validator: (value) => value!.isEmpty
                                    ? "Description is required"
                                    : null,
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
                                      hintText:
                                          "What’s the date when you found",
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorsApp.secondaryColor),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 2),
                                      ),
                                      suffixIcon: Icon(Icons.calendar_today),
                                    ),
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime.now(),
                                      );
                                      if (pickedDate != null) {
                                        setState(() {
                                          selectedDate = pickedDate;
                                          dateController.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(selectedDate!);
                                          //widget.onDatePicked(selectedDate!);
                                        });
                                      }
                                    },
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? "Please select Date "
                                            : null,
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
                                validator: (value) => value!.isEmpty
                                    ? "Location link is required"
                                    : null,
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
                                      style:
                                          AppStyles.urbanistMedium14(context),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: ColorsApp
                                                .secondaryColorOpicaty),
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
                          )
                        //
                        //request for adoption
                        //
                        : Column(
                            children: [
                              CustomTextField(
                                onDataChanged: (p0) {},
                                text: "Type*",
                                hintText: "Type of pet",
                                validator: (value) => value!.isEmpty
                                    ? "determine type of pet is required"
                                    : null,
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
                                validator: (value) =>
                                    value!.isEmpty ? "title is required" : null,
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
                                validator: (value) => value!.isEmpty
                                    ? "Description is required"
                                    : null,
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
                                options: [
                                  "Small",
                                  "Medium",
                                  "Big",
                                  "Don't know"
                                ],
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
                                validator: (value) => value!.isEmpty
                                    ? "Location link is required"
                                    : null,
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
                                      style:
                                          AppStyles.urbanistMedium14(context),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color:
                                                ColorsApp.primaryColorOpicaty),
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
                          )
                  ],
                ),
              ),
            ),
            Custombutton(
              text: "Submet",
              width: MediaQuery.sizeOf(context).width,
              onTap: () {},
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
