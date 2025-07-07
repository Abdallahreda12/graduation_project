import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/appImages.dart';

class UploadphotoInAdditionalInfoEdit extends StatelessWidget {
  final List<File> selectedImages;
  final VoidCallback onUploadPhoto;

  const UploadphotoInAdditionalInfoEdit({
    super.key,
    required this.selectedImages,
    required this.onUploadPhoto,
  });

  @override
  Widget build(BuildContext context) {
    final image = selectedImages.isNotEmpty ? selectedImages.first : null;

    return Column(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: image != null
              ? FileImage(image)
              : const AssetImage(Assets.imagesAnonymousAvatar) as ImageProvider,
        ),
        const SizedBox(height: 10),
        Custombutton(
          text: "Upload Picture",
          onTap: onUploadPhoto,
          width: 180,
          borderradius: 50,
        ),
      ],
    );
  }
}
