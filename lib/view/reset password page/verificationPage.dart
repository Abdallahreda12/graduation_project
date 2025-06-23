import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verification',
                style: AppStyles.urbanistMedium22(context),
              ),
              const SizedBox(height: 7),
              Text(
                "We've sent the code to you",
                style: AppStyles.urbanistReqular14(context),
              ),
              const SizedBox(height: 45),

              // OTP Input Fields (you can use a package like pin_code_fields for this)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 60,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: ColorsApp.primaryColor),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "didn't receive the code?",
                    style: AppStyles.urbanistReqular14(context),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "resend code",
                      style: AppStyles.urbanistMedium14(context)
                          .copyWith(color: ColorsApp.primaryColor),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Custombutton(
                text: 'Verify',
                width: double.infinity,
                onTap: () {
                  Get.toNamed("/createnewpasswordpage");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
