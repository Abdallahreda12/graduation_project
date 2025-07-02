import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/AddRequestController.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
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
  final controller = Get.find<AddRequestControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          onDataChanged: (p0) {
            controller.title = p0;
          },
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
          onDataChanged: (p0) {
            controller.description = p0;
          },
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
              controller: controller.dateController,
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
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                        primary:
                            ColorsApp.secondaryColor, // Header background color
                        onPrimary: Colors.white,
                        onSurface: Colors.black,
                      )),
                      child: child!,
                    ); // Body text color, child: child)
                  },
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    controller.selectedDate = pickedDate;
                    controller.dateController.text = DateFormat('yyyy-MM-dd')
                        .format(controller.selectedDate!);
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
        //
        //pass controller to it to show new value in textfield
        //
        CustomTextField(
          controller: controller.locationController,
          onDataChanged: (p0) {
            controller.locatonLink = p0;
          },
          text: "Location Link*",
          hintText: "Location of the case",
          validator: (value) =>
              value!.isEmpty ? "Location link is required" : null,
          hintMaxLines: 1,
          borderColor: ColorsApp.secondaryColor,
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
                backGroundColor: ColorsApp.secondaryColor,
                height: 40,
                borderradius: 25,
                text: "get current location",
                width: ((MediaQuery.sizeOf(context).width * 0.5) -
                    10), //doesn't make any effect because there is expanded but it is required so..
                onTap: () {
                  controller.getLinkInCurrentLocation();
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Custombutton(
                  backGroundColor: ColorsApp.secondaryColor,
                  height: 40,
                  borderradius: 25,
                  text: "open google map",
                  width: ((MediaQuery.sizeOf(context).width * 0.5) -
                      10), //doesn't make any effect because there is expanded but it is required so..
                  onTap: () => controller.openMap(context)),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          onDataChanged: (p0) {
            controller.contactInfo = p0;
          },
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
          onDataChanged: (p0) {
            controller.socialmediaLink = p0;
          },
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: controller.pickImages,
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
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: controller.selectedImages.map((img) {
                      final isSelected =
                          controller.selectedImagePaths.contains(img.path);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              controller.selectedImagePaths.remove(img.path);
                            } else {
                              controller.selectedImagePaths.add(img.path);
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
              ), //
              // Delete button appears only if any photo is selected
              //
              if (controller.selectedImagePaths.isNotEmpty) ...[
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
                        controller.selectedImages.removeWhere((img) =>
                            controller.selectedImagePaths.contains(img.path));
                        controller.selectedImagePaths.clear();
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
    );
  }
}
