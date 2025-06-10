import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/bookPages/AnimalOwnerPage/widgets/formFieldInAnimalOwnerPage.dart';

class AnimalOwnerPage extends StatefulWidget {
  const AnimalOwnerPage({super.key});

  @override
  State<AnimalOwnerPage> createState() => _AnimalOwnerPageState();
}

class _AnimalOwnerPageState extends State<AnimalOwnerPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: Stack(children: [
        Positioned.fill(
          child: SvgPicture.asset(
            Assets.imagesLogoInverse,
            fit: BoxFit.none,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
          child: Column(
            children: [
              //
              //header of page
              //
              TextAndBackArrowHeader(
                  texts: ["Animal Ownar"], colorsOfTexts: [Colors.black]),
              SizedBox(
                height: 25,
              ),
              Form(
                key: _formKey,
                child: Expanded(
                  child: SingleChildScrollView(
                      child: FormFieldInanimalOwnerPage()),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 33,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Custombutton(
              isActive: true,
              text: 'Done',
              width: MediaQuery.sizeOf(context).width,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  showAppointmentDialog(context);
                }
              },
            ),
          ),
        ),
      ]),
    );
  }
}

void showAppointmentDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismiss on tap outside
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Check Icon
              CircleAvatar(
                backgroundColor: ColorsApp.primaryColor,
                radius: 40,
                child: Icon(Icons.check, color: Colors.white, size: 40),
              ),
              SizedBox(height: 10),
              // Title
              Text("Congratulations",
                  style: AppStyles.urbanistMedium24(context)
                      .copyWith(color: Colors.black)),
              SizedBox(height: 8),
              // Subtitle
              Text(
                "Appointment successfully booked.",
                style: AppStyles.urbanistReqular14(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // View Appointment Button
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed("/mainbookpage");
                  // Navigate to the appointment page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.primaryColor,
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "View Appointment",
                  style: AppStyles.urbanistSemiBold14(context)
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
