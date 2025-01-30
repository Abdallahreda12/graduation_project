import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class CustomUploadPhotoSignUp3DoctorPage extends StatelessWidget {
  const CustomUploadPhotoSignUp3DoctorPage(
      {super.key, required this.onUploadPhoto});
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
              backgroundColor: ColorsApp.primaryColor,
              child: Image.asset(Assets.imagesAnonymousAvatar),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Profile Photo",
            style: AppStyles.urbanistMedium22(context).copyWith(
              color: Color(0xff004A5A),
              fontSize: 24,
              fontWeight: FontWeight.w600,
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
