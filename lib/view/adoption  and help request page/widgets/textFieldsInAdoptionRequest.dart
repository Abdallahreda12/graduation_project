import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/Widgets/customCheckBoxList.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/customFunctions.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class TextFieldsInAdoptionRequest extends StatefulWidget {
  const TextFieldsInAdoptionRequest({super.key});

  @override
  State<TextFieldsInAdoptionRequest> createState() =>
      _TextFieldsInAdoptionRequestState();
}

class _TextFieldsInAdoptionRequestState
    extends State<TextFieldsInAdoptionRequest> {
  TextEditingController locationController = TextEditingController();

  //to put on it images
  List<File> selectedImages = [];
  Set<String> selectedImagePaths = {};
  //
  //function to pick images
  //
  Future<void> pickImages() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedImages.addAll(
          result.paths.map((path) => File(path!)).toList(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          CustomTextField(
            onDataChanged: (p0) {},
            text: "Type*",
            hintText: "Type of your pet",
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
            controller: locationController,
            onDataChanged: (p0) {},
            text: "Location*",
            hintText: "Your location",
            validator: (value) =>
                value!.isEmpty ? "Location link is required" : null,
            hintMaxLines: 1,
            borderColor: ColorsApp.primaryColor,
          ),
          SizedBox(
            height: 5,
          ),
          //
          //two buttons to get location link (will remove but after get suitable design)
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Custombutton(
                  height: 40,
                  borderradius: 25,
                  text: "get current location",
                  width: ((MediaQuery.sizeOf(context).width * 0.5) -
                      10), //doesn't make any effect because there is expanded but it is required so..
                  onTap: () async {
                    locationController.text =
                        await CustomFunctions.getCurrentLocation();
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Custombutton(
                    height: 40,
                    borderradius: 25,
                    text: "open google map",
                    width: ((MediaQuery.sizeOf(context).width * 0.5) -
                        10), //doesn't make any effect because there is expanded but it is required so..
                    onTap: () => CustomFunctions.openGoogleMaps(context)),
              ),
            ],
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: pickImages,
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
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: selectedImages.map((img) {
                        final isSelected =
                            selectedImagePaths.contains(img.path);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedImagePaths.remove(img.path);
                              } else {
                                selectedImagePaths.add(img.path);
                              }
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.red
                                        : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                                child: Image.file(
                                  img,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (isSelected)
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
                //
                // Delete button appears only if any photo is selected
                //
                if (selectedImagePaths.isNotEmpty) ...[
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Delete Selected",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedImages.removeWhere(
                              (img) => selectedImagePaths.contains(img.path));
                          selectedImagePaths.clear();
                        });
                      },
                    ),
                  ),
                ]
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    ]);
  }
}
