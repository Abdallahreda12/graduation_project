import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/appImages.dart';

class UploadphotoInAdditionalInfoEdit extends StatelessWidget {
  final List<File> selectedImages;
  final VoidCallback onUploadPhoto;
  final String? initialImageUrl; // network image URL

  const UploadphotoInAdditionalInfoEdit({
    super.key,
    required this.selectedImages,
    required this.onUploadPhoto,
    this.initialImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    Widget avatarContent;

    if (selectedImages.isNotEmpty) {
      avatarContent = Image.file(
        selectedImages.first,
        fit: BoxFit.cover,
      );
    } else if (initialImageUrl != null && initialImageUrl!.isNotEmpty) {
      avatarContent = CachedNetworkImage(
        imageUrl: initialImageUrl!,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) =>
            Image.asset(Assets.imagesAnonymousAvatar, fit: BoxFit.cover),
        fit: BoxFit.cover,
      );
    } else {
      avatarContent = Image.asset(
        Assets.imagesAnonymousAvatar,
        fit: BoxFit.cover,
      );
    }

    return Column(
      children: [
        ClipOval(
          child: SizedBox(
            width: 150,
            height: 150,
            child: avatarContent,
          ),
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
