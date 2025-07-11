import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/animal_owner_controller.dart';
import 'package:graduation_project/core/Widgets/customTextField.dart';
import 'package:graduation_project/core/util/styles.dart';

class FormFieldInanimalOwnerPage extends StatelessWidget {
  const FormFieldInanimalOwnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AnimalOwnerController>();
    
    return Column(
      children: [
        CustomTextField(
          controller: controller.fullNameController,
          onDataChanged: (String value) {
            controller.fullNameController.text = value;
          },
          text: 'Full Name',
          hintText: 'Enter your Name',
          validator: (value) => value!.isEmpty ? "Name is required" : null,
        ),
        SizedBox(height: 25),
      
        CustomTextField(
          controller: controller.animalTypeController,
          onDataChanged: (String value) {
            controller.animalTypeController.text = value;
          },
          text: 'Animal Type',
          hintText: 'e.g. cat, dog, bird',
          validator: (value) => value!.isEmpty ? "Animal type is required" : null,
        ),
        SizedBox(height: 25),
        
        CustomTextField(
          controller: controller.ageController,
          onDataChanged: (String value) {
            controller.ageController.text = value;
          },
          text: 'Animal Age',
          hintText: 'Enter animal age',
          validator: (value) {
            if (value!.isEmpty) return "Age is required";
            if (int.tryParse(value) == null) return "Please enter a valid age";
            return null;
          },
        ),
        SizedBox(height: 25),
        
        // Gender Selection
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gender',
              style: AppStyles.urbanistMedium16(context)
                  .copyWith(color: Colors.black),
            ),
            SizedBox(height: 8),
            GetBuilder<AnimalOwnerController>(
              builder: (controller) => Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.selectedGender,
                    isExpanded: true,
                    hint: Text('Select Gender'),
                    items: ['Male', 'Female', 'Unknown']
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.selectedGender = newValue;
                        controller.update();
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        
        CustomTextField(
          controller: controller.problemController,
          onDataChanged: (String value) {
            controller.problemController.text = value;
          },
          text: 'Write The Animal Problem',
          hintText: 'Write the Animal problem',
          maxLine: 4,
          validator: (value) => value!.isEmpty ? "Problem description is required" : null,
        ),
        SizedBox(height: 25),
        
        // Booking Summary
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Booking Summary',
                style: AppStyles.urbanistMedium16(context)
                    .copyWith(color: Colors.black),
              ),
              SizedBox(height: 12),
              GetBuilder<AnimalOwnerController>(
                builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSummaryRow('Clinic', controller.clinic?.name ?? 'N/A'),
                    _buildSummaryRow('Date', controller.date ?? 'N/A'),
                    _buildSummaryRow('Time', controller.time ?? 'N/A'),
                    _buildSummaryRow('Package', controller.selectedPackage!.name  ),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label + ':',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}