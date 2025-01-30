import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:intl/intl.dart';

class CustomSignUp3FormUserPage extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String) onNameChanged;
  final TextEditingController dateOfBirthController;
  final Function(DateTime) onDateSelected;
  final Function(String) onEmailChanged;
  final Function(String) onPhoneChanged;
  final String? selectedGender;
  final Function(String?) onGenderChanged;

  const CustomSignUp3FormUserPage({
    super.key,
    required this.formKey,
    required this.onNameChanged,
    required this.dateOfBirthController,
    required this.onDateSelected,
    required this.onEmailChanged,
    required this.onPhoneChanged,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  @override
  State<CustomSignUp3FormUserPage> createState() =>
      _CustomSignUp3FormUserPageState();
}

class _CustomSignUp3FormUserPageState extends State<CustomSignUp3FormUserPage> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            onDataChanged: widget.onNameChanged,
            text: "Full Name",
            hintText: "What is your full name",
            borderradius: 20,
            validator: (value) => value!.isEmpty ? "Name is required" : null,
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Date of Birth",
                  style: AppStyles.urbanistReqular14(context)),
              const SizedBox(height: 5),
              TextFormField(
                controller: widget.dateOfBirthController,
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
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                      widget.dateOfBirthController.text =
                          DateFormat('yyyy-MM-dd').format(_selectedDate!);
                    });
                    widget.onDateSelected(_selectedDate!);
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
                onChanged: widget.onGenderChanged,
                validator: (value) =>
                    value == null ? "Please select your gender" : null,
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: widget.onEmailChanged,
            text: "Email Address",
            hintText: "What’s your email address",
            borderradius: 20,
            validator: (value) =>
                value!.contains('@') ? null : "Please enter a valid email",
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: widget.onPhoneChanged,
            text: "Phone Number",
            hintText: "What’s your phone number",
            borderradius: 20,
            validator: (value) => value!.length <= 11
                ? "Please enter a valid phone number"
                : null,
          ),
        ],
      ),
    );
  }
}
