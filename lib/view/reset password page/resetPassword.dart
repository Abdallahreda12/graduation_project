import 'package:flutter/material.dart';
import 'package:graduation_project/core/Widgets/customButton.dart';
import 'package:graduation_project/core/util/styles.dart';
import 'package:graduation_project/view/reset%20password%20page/widgets/resetOptionTile.dart';

enum ResetMethod { email, phone }

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  ResetMethod? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {},
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forget Password',
              style: AppStyles.urbanistMedium22(context),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              'Please select option to reset password',
              style: AppStyles.urbanistReqular14(context),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 25,
            ),
            ResetOptionTile(
              title: 'via Email',
              subtitle: 'We will send a code \nto your email',
              icon: Icons.email_outlined,
              isSelected: selectedMethod == ResetMethod.email,
              onTap: () {
                setState(() {
                  selectedMethod = ResetMethod.email;
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            ResetOptionTile(
              title: 'via Phone Number',
              subtitle: 'We will send a code \nto your Phone Number',
              icon: Icons.call_outlined,
              isSelected: selectedMethod == ResetMethod.phone,
              onTap: () {
                setState(() {
                  selectedMethod = ResetMethod.phone;
                });
              },
            ),
            Spacer(),
            Custombutton(
              text: 'Reset Password',
              width: double.infinity,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
