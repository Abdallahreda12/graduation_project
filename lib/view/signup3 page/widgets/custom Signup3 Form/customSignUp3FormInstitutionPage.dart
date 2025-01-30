import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';

class CustomSignUp3FormInstitutionPage extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String) onNameChanged;
  final Function(String) onDescriptionChanged;
  final Function(String) onRegistrationChanged;
  final Function(String) onWebsiteChanged;
  final Function(String) onFacebookChanged;

  const CustomSignUp3FormInstitutionPage({
    super.key,
    required this.formKey,
    required this.onNameChanged,
    required this.onDescriptionChanged,
    required this.onRegistrationChanged,
    required this.onWebsiteChanged,
    required this.onFacebookChanged,
  });

  @override
  State<CustomSignUp3FormInstitutionPage> createState() =>
      _CustomSignUp3FormInstitutionPageState();
}

class _CustomSignUp3FormInstitutionPageState
    extends State<CustomSignUp3FormInstitutionPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            onDataChanged: widget.onNameChanged,
            text: "Name of Institution",
            hintText: "What is your institution name",
            borderradius: 20,
            validator: (value) => value!.isEmpty ? "Name is required" : null,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: widget.onDescriptionChanged,
            text: "Description",
            hintText: "Describe the purpose of the institution",
            borderradius: 20,
            validator: (value) => value!.isEmpty
                ? "Required to provide summarization about institution"
                : null,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: widget.onRegistrationChanged,
            text: "Registration Details",
            hintText: "License or registration number",
            borderradius: 20,
            validator: (value) =>
                value!.isEmpty ? "Please provide your License number" : null,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: (value) {},
            text: "Email Address",
            hintText: "What’s your email address",
            borderradius: 20,
            validator: (value) =>
                value!.contains('@') ? null : "Please enter a valid email",
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: (value) {},
            text: "Phone Number",
            hintText: "What’s your phone number",
            borderradius: 20,
            validator: (value) => value!.length <= 11
                ? "Please enter a valid phone number"
                : null,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: widget.onWebsiteChanged,
            text: "Website",
            hintText: "Institution’s Website",
            borderradius: 20,
            validator: (value) => null,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            onDataChanged: widget.onFacebookChanged,
            text: "Facebook link",
            hintText: "Institution’s Facebook link",
            borderradius: 20,
            validator: (value) => null,
          ),
        ],
      ),
    );
  }
}
