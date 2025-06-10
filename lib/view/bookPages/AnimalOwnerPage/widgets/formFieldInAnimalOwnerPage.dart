import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';

class FormFieldInanimalOwnerPage extends StatelessWidget {
  const FormFieldInanimalOwnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          onDataChanged: (String) {},
          text: 'Full Name',
          hintText: 'Enter your Name',
          validator: (value) => value!.isEmpty ? "Name is required" : null,
        ),
        SizedBox(
          height: 25,
        ),
        CustomTextField(
          onDataChanged: (String) {},
          text: 'Phone Number',
          hintText: 'Enter Your Phone Namber',
          validator: (value) =>
              value!.length <= 11 ? "Please enter a valid phone number" : null,
        ),
        SizedBox(
          height: 25,
        ),
        CustomTextField(
          onDataChanged: (String) {},
          text: 'Animal Type',
          hintText: 'e.g. cat, dog, bird',
          validator: (value) => value!.isEmpty ? "Name is required" : null,
        ),
        SizedBox(
          height: 25,
        ),
        CustomTextField(
          onDataChanged: (String) {},
          text: 'Write The Animal problem',
          hintText: 'Write the Animal problem',
          maxLine: 4,
          validator: (value) => value!.isEmpty ? "Name is required" : null,
        ),
      ],
    );
  }
}
