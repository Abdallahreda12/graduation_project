import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';

class EditePhoto extends StatelessWidget {
  const EditePhoto(
      {super.key, required this.onUploadPhoto, required this.selectedImages});

  final File? selectedImages;
  final VoidCallback onUploadPhoto;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Avatar and Upload Button
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: ColorsApp.primaryColor, width: 3),
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(80),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundImage: selectedImages != null
                  ? FileImage(selectedImages!)
                  : AssetImage(Assets.imagesAnonymousAvatar) as ImageProvider,
            ),
          ),

          const SizedBox(height: 15),
          Custombutton(
            text: "Upload Picture",
            width: 180,
            onTap: onUploadPhoto,
            borderradius: 50,
          ),
        ],
      ),
    );
  }
}
