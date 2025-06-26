import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:intl/intl.dart';

class CustomSignUp3FormDoctorPage extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String) onFirstNameChanged;
  final Function(String) onLastNameChanged;
  final Function(String) onEmailChanged;
  final Function(String) onPhoneChanged;
  final TextEditingController dateController;
  final Function(DateTime) onDatePicked;
  final Function(String?) onGenderSelected;
  final String? selectedGender;

  const CustomSignUp3FormDoctorPage({
    super.key,
    required this.formKey,
    required this.onFirstNameChanged,
    required this.onEmailChanged,
    required this.onPhoneChanged,
    required this.dateController,
    required this.onDatePicked,
    required this.onGenderSelected,
    this.selectedGender,
    required this.onLastNameChanged,
  });

  @override
  State<CustomSignUp3FormDoctorPage> createState() =>
      _CustomSignUp3FormDoctorPageState();
}

class _CustomSignUp3FormDoctorPageState
    extends State<CustomSignUp3FormDoctorPage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          CustomTextField(
            onDataChanged: widget.onFirstNameChanged,
            text: "First Name",
            hintText: "What is your First name",
            borderradius: 20,
            validator: (value) =>
                value!.isEmpty ? "First Name is required" : null,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: widget.onLastNameChanged,
            text: "Last Name",
            hintText: "What is your Last name",
            borderradius: 20,
            validator: (value) =>
                value!.isEmpty ? "Last Name is required" : null,
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
                    borderSide: BorderSide(color: ColorsApp.primaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
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
                              ColorsApp.primaryColor, // Header background color
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
                      selectedDate = pickedDate;
                      widget.dateController.text =
                          DateFormat('yyyy-MM-dd').format(selectedDate!);
                      //widget.onDatePicked(selectedDate!);
                    });
                  }
                },
                validator: (value) => value == null || value.isEmpty
                    ? "Please select your date of birth"
                    : null,
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Gender Dropdown
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
                    borderSide: BorderSide(color: ColorsApp.primaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2),
                  ),
                ),
                value: widget.selectedGender,
                items: ['Male', 'Female']
                    .map((gender) =>
                        DropdownMenuItem(value: gender, child: Text(gender)))
                    .toList(),
                onChanged: widget.onGenderSelected,
                validator: (value) =>
                    value == null ? "Please select your gender" : null,
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Phone Number Field
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
