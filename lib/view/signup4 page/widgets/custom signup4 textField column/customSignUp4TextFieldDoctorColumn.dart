import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/clinicContriller.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/data/models/clinicFormModel.dart';
import 'package:graduation_project/view/signup%20page/widgets/stepsRow.dart';

import 'package:file_picker/file_picker.dart';
import 'dart:io';

class CustomSignUp4TextFieldDoctorColumn extends StatefulWidget {
  final Function(String) onSpecializationChanged;
  final Function(String) onDegreesChanged;
  final Function(String) onLicensingChanged;
  final Function(String) onExperienceChanged;

  const CustomSignUp4TextFieldDoctorColumn({
    super.key,
    required this.onSpecializationChanged,
    required this.onDegreesChanged,
    required this.onLicensingChanged,
    required this.onExperienceChanged,
    required Null Function(dynamic value) onClinicNameChanged,
    required Null Function(dynamic value) onClinicAddressChanged,
  });

  @override
  State<CustomSignUp4TextFieldDoctorColumn> createState() =>
      _CustomSignUp4TextFieldDoctorColumnState();
}

class _CustomSignUp4TextFieldDoctorColumnState
    extends State<CustomSignUp4TextFieldDoctorColumn> {
  final controller = Get.find<ClinicController>();

  void addNewClinic() {
    setState(() {
      controller.clinics.add(ClinicFormModel());
    });
  }

  void addNewPackage(int clinicIndex) {
    setState(() {
      controller.clinics[clinicIndex].packages.add(PackageModel());
    });
  }

  void removePackage(int clinicIndex, int packageIndex) {
    setState(() {
      controller.clinics[clinicIndex].packages.removeAt(packageIndex);
    });
  }

  void pickTime(int index, bool isStart) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      String time = picked.format(context);
      setState(() {
        if (isStart) {
          controller.clinics[index].startTime = time;
        } else {
          controller.clinics[index].endTime = time;
        }
      });
    }
  }

  void pickFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        controller.clinics[index].file = File(result.files.single.path!);
      });
    }
  }

  Widget buildPackageForm(int clinicIndex, int packageIndex) {
    PackageModel package =
        controller.clinics[clinicIndex].packages[packageIndex];
    final List<String> packageOptions = [
      "Voice Call",
      "Messaging",
      "Video Call",
      "Visit Clinic"
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Package ${packageIndex + 1}",
                style: AppStyles.urbanistMedium16(context),
              ),
              IconButton(
                onPressed: () => removePackage(clinicIndex, packageIndex),
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Package Name Dropdown
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Package Name",
                style: AppStyles.urbanistMedium14(context),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: package.name.isEmpty ? null : package.name,
                    hint: const Text("Select Package Type"),
                    isExpanded: true,
                    items: packageOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        package.name = newValue ?? '';
                      });
                    },
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          CustomTextField(
            onDataChanged: (value) => package.price = value,
            text: "Package Price",
            hintText: "e.g., 100, 200, 300",
            borderradius: 20,
            validator: (String? value) {},
          ),
        ],
      ),
    );
  }

  Widget buildClinicForm(int index) {
    ClinicFormModel clinic = controller.clinics[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Clinic ${index + 1}", style: AppStyles.urbanistMedium22(context)),
        CustomTextField(
          onDataChanged: (value) => clinic.name = value,
          text: "Clinic Name",
          hintText: "Clinic Name",
          borderradius: 20,
          validator: (String? value) {},
        ),
        CustomTextField(
          onDataChanged: (value) => clinic.location = value,
          text: "Clinic Location",
          hintText: "City / Address",
          borderradius: 20,
          validator: (String? value) {},
        ),
        CustomTextField(
          onDataChanged: (value) => clinic.phone = value,
          text: "Clinic Phone",
          hintText: "Phone Number",
          borderradius: 20,
          validator: (String? value) {},
        ),

        // Days selection
        Text("Working Days", style: AppStyles.urbanistMedium16(context)),
        const SizedBox(height: 10),
        Wrap(
          children: [
            for (var day in [
              "Monday",
              "Tuesday",
              "Wednesday",
              "Thursday",
              "Friday",
              "Saturday",
              "Sunday"
            ])
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: clinic.dayOfWeek.contains(day),
                    onChanged: (val) {
                      setState(() {
                        val!
                            ? clinic.dayOfWeek.add(day)
                            : clinic.dayOfWeek.remove(day);
                      });
                    },
                  ),
                  Text(day),
                ],
              ),
          ],
        ),

        // Time selection
        const SizedBox(height: 15),
        Text("Working Hours", style: AppStyles.urbanistMedium16(context)),
        const SizedBox(height: 10),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(ColorsApp.primaryColor)),
              onPressed: () => pickTime(index, true),
              child: Text(
                clinic.startTime.isEmpty ? "Start Time" : clinic.startTime,
                style: AppStyles.urbanistReqular12(context)
                    .copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(ColorsApp.primaryColor)),
              onPressed: () => pickTime(index, false),
              child: Text(
                clinic.endTime.isEmpty ? "End Time" : clinic.endTime,
                style: AppStyles.urbanistReqular12(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),

        // File selection
        const SizedBox(height: 15),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll<Color>(ColorsApp.primaryColor)),
          onPressed: () => pickFile(index),
          child: Text(
            clinic.file == null
                ? "Pick File"
                : clinic.file!.path.split('/').last,
            style: AppStyles.urbanistReqular12(context)
                .copyWith(color: Colors.white),
          ),
        ),

        // Packages section
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Packages", style: AppStyles.urbanistMedium18(context)),
            ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll<Color>(ColorsApp.primaryColor)),
              onPressed: () => addNewPackage(index),
              icon: const Icon(Icons.add, color: Colors.white, size: 16),
              label: Text(
                "Add Package",
                style: AppStyles.urbanistReqular12(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Display packages
        for (int i = 0; i < clinic.packages.length; i++)
          buildPackageForm(index, i),

        const Divider(thickness: 1),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepsRow(currentIndex: 5),
        const SizedBox(height: 25),
        CustomTextField(
          onDataChanged: widget.onSpecializationChanged,
          text: "Specialization",
          hintText: "Specialized in?",
          borderradius: 20,
          validator: (String? value) {},
        ),
        CustomTextField(
          onDataChanged: widget.onDegreesChanged,
          text: "Degrees",
          hintText: "Academic Degree",
          borderradius: 20,
          validator: (String? value) {},
        ),
        CustomTextField(
          onDataChanged: widget.onLicensingChanged,
          text: "License Info",
          hintText: "License Number",
          borderradius: 20,
          validator: (String? value) {},
        ),
        CustomTextField(
          onDataChanged: widget.onExperienceChanged,
          text: "Experience",
          hintText: "Years of Experience",
          borderradius: 20,
          validator: (String? value) {},
        ),
        const SizedBox(height: 25),
        for (int i = 0; i < controller.clinics.length; i++) buildClinicForm(i),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll<Color>(ColorsApp.primaryColor)),
          onPressed: addNewClinic,
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: Text(
            "Add Another Clinic",
            style: AppStyles.urbanistReqular12(context)
                .copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
