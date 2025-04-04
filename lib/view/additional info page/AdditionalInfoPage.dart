import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/Widgets/headerOfAdotinAndHelpPage.dart';
import 'package:graduation_project/core/util/appImages.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/profile%20page/widgets/personCardInProfilePage.dart';

class AdditionalInfoPage extends StatefulWidget {
  const AdditionalInfoPage({super.key});

  @override
  State<AdditionalInfoPage> createState() => _AdditionalInfoPageState();
}

class _AdditionalInfoPageState extends State<AdditionalInfoPage> {
  late String userName;
  late String userEmailAddress;
  late String ageRangeOfAnimal;
  late String areYouHelper;
  late String lookingForAdoption;
  late String animalsAdoptionPreferred;
  late String haveYouAdoptBefore;
  late String haveExperienceWithAnimalCare;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextAndBackArrowHeader(
                        texts: ["Additional Info"],
                        colorsOfTexts: [Colors.black]),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/additionalinfoeditpage');
                    },
                    child: Icon(
                      Icons.edit_note_outlined,
                      size: 28,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              //
              //profile card
              //
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PersonCardInProfilePage(
                        name: "Abdallah Reda",
                        image: Assets.imagesProfilePhoto,
                        gmail: "Abdallah@gmail.com",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AdditionalInfoCard(
                        question: "Age Range of animals that you preferred",
                        answer: "Young",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      AdditionalInfoCard(
                        question: "Are you helper?",
                        answer: "Yes",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      AdditionalInfoCard(
                        question: "Are you looking for adoption?",
                        answer: "No",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      AdditionalInfoCard(
                        question: "Animals adoption preferred",
                        answer: "Dog",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      AdditionalInfoCard(
                        question: "Have you adopt before?",
                        answer: "yes",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      AdditionalInfoCard(
                        question: "Do you have experience with animal care?",
                        answer: "No",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class AdditionalInfoCard extends StatelessWidget {
  const AdditionalInfoCard(
      {super.key, required this.question, required this.answer});

  final String question;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              color: ColorsApp.primaryColorOpicaty),
          child: Text(
            question,
            style: AppStyles.urbanistMedium16(context)
                .copyWith(color: ColorsApp.primaryColor),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(10)),
              color: ColorsApp.primaryColorOpicaty),
          child: Text(
            answer,
            style: AppStyles.urbanistReqular16(context),
          ),
        ),
      ],
    );
  }
}
