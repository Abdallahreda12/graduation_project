import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/signUpController.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/signup3%20page/widgets/location_selector.dart';
import 'package:intl/intl.dart';

class CustomSignUp3FormDoctorPage extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String) onFirstNameChanged;
  final Function(String) onLastNameChanged;
  final Function(String) onEmailChanged;
  final Function(String) onPhoneChanged;
  final TextEditingController dateController;
  final Function(DateTime) onDatePicked;
  final String? selectedGender;
  final Function(String?) onGenderSelected;
  final Function(String, String) onLocationSelected;
  final String? initialGovernorate;
  final String? initialCity; 

  const CustomSignUp3FormDoctorPage({
    super.key,
    required this.formKey,
    required this.onFirstNameChanged,
    required this.onLastNameChanged,
    required this.onEmailChanged,
    required this.onPhoneChanged,
    required this.dateController,
    required this.onDatePicked,
    required this.selectedGender,
    required this.onGenderSelected,
    required this.onLocationSelected,
    this.initialGovernorate,
    this.initialCity,
  });

  @override
  State<CustomSignUp3FormDoctorPage> createState() =>
      _CustomSignUp3FormDoctorPageState();
}

class _CustomSignUp3FormDoctorPageState
    extends State<CustomSignUp3FormDoctorPage> {
  DateTime? _selectedDate;
  final SignUpControllerImp controller = Get.find<SignUpControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            onDataChanged: widget.onFirstNameChanged,
            text: "First Name",
            hintText: "What is your first name",
            borderradius: 20,
            validator: (value) =>
                value!.isEmpty ? "First name is required" : null,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: widget.onLastNameChanged,
            text: "Last Name",
            hintText: "What is your last name",
            borderradius: 20,
            validator: (value) =>
                value!.isEmpty ? "Last name is required" : null,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: widget.onEmailChanged,
            text: "Email",
            hintText: "Enter your email address",
            borderradius: 20,
            validator: (value) {
              if (value!.isEmpty) {
                return "Email is required";
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return "Please enter a valid email";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Date of Birth",
                  style: AppStyles.urbanistReqular14(context)),
              const SizedBox(height: 5),
              TextFormField(
                controller: widget.dateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Date of birth",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: ColorsApp.primaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 2),
                  ),
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                          primary: ColorsApp.primaryColor,
                          onPrimary: Colors.white,
                          onSurface: Colors.black,
                        )),
                        child: child!,
                      );
                    },
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                      widget.dateController.text =
                          DateFormat('yyyy-MM-dd').format(_selectedDate!);
                      widget.onDatePicked(pickedDate);
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select your date of birth";
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Gender", style: AppStyles.urbanistMedium14(context)),
              const SizedBox(height: 5),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: "Select Gender",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: ColorsApp.primaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 2),
                  ),
                ),
                value: widget.selectedGender,
                items: ['Male', 'Female']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: widget.onGenderSelected,
                validator: (value) =>
                    value == null ? "Please select your gender" : null,
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: widget.onPhoneChanged,
            text: "Phone Number",
            hintText: "What’s your phone number",
            borderradius: 20,
            validator: (value) =>
                value!.length < 11 ? "Please enter a valid phone number" : null,
          ),
          const SizedBox(height: 10),
          LocationSelector(
            onLocationSelected: widget.onLocationSelected,
            initialGovernorate: widget.initialGovernorate,
            initialCity: widget.initialCity,
          ),
        ],
      ),
    );
  }
}