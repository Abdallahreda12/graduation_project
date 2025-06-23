import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class PhoneEntryPage extends StatefulWidget {
  const PhoneEntryPage({super.key});

  @override
  State<PhoneEntryPage> createState() => _PhoneEntryPageState();
}

class _PhoneEntryPageState extends State<PhoneEntryPage> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();

  String phoneNumber = "";

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
                'Reset via Phone Number',
                style: AppStyles.urbanistMedium22(context),
              ),
              const SizedBox(height: 7),
              Text(
                'Please enter your phone number',
                style: AppStyles.urbanistReqular14(context),
              ),
              const SizedBox(height: 45),
              Form(
                key: globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number",
                      style: AppStyles.urbanistMedium14(context),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        final isValidPhone =
                            RegExp(r'^\d{11}$').hasMatch(value!);
                        if (value.isEmpty || !isValidPhone) {
                          return "Invalid phone number";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = value;
                        });

                        /// Stope keyboard at 11 digits
                        if (value.length == 11) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorsApp.primaryColor),
                        ),
                        border: OutlineInputBorder(),
                        hintText: "e.g. 01012345678",
                        suffixIcon: Icon(
                          Icons.phone,
                          color: ColorsApp.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Custombutton(
                text: 'Next',
                width: double.infinity,
                onTap: () {
                  // if (globalKey.currentState!.validate()) {
                  Get.toNamed("/verificationpage");
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
