import 'package:flutter/material.dart';
import 'package:graduation_project/core/util/colors.dart';
import 'package:graduation_project/core/util/styles.dart';

class FormSignUpPage extends StatefulWidget {
  const FormSignUpPage({
    super.key,
    required this.globalKey,
    required this.emailController,
    required this.onEmailChanged,
    required this.onPasswordChanged,
  });
  final GlobalKey<FormState> globalKey;
  final TextEditingController emailController;

  final Function(String) onEmailChanged;
  final Function(String) onPasswordChanged;
  @override
  State<FormSignUpPage> createState() => _FormSignUpPageState();
}

class _FormSignUpPageState extends State<FormSignUpPage> {
  Color iconPassColor = Colors.grey;

  Color iconGmailColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.globalKey,
      //
      //column contains all textfields
      //
      child: Column(
        children: [
          //
          //first Textfield
          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: AppStyles.urbanistMedium14(context),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: widget.emailController,
                validator: (value) {
                  bool validGmail = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                      .hasMatch(value!);
                  if (value.isEmpty || validGmail == false) {
                    return "invaild Email";
                  }
                  return null;
                },
                onChanged: widget.onEmailChanged,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.primaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                  hintText: "YourGmail@gmail.com",
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.alternate_email_sharp,
                      color: iconGmailColor,
                    ),
                    onTap: () {
                      setState(
                        () {
                          if (iconGmailColor == Colors.grey) {
                            iconGmailColor = ColorsApp.primaryColor;
                            widget.emailController.text = "@gmail.com";
                          } else {
                            iconGmailColor = Colors.grey;
                            widget.emailController.text = "";
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          //
          //second textfield
          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: AppStyles.urbanistMedium14(context),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return "invaild Password";
                  } else {
                    widget.onPasswordChanged;
                  }
                  return null;
                },
                obscureText: iconPassColor == Colors.grey ? false : true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.primaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                  hintText: "Strong Password Please",
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.visibility_off,
                      color: iconPassColor,
                    ),
                    onTap: () {
                      setState(() {
                        iconPassColor == Colors.red
                            ? iconPassColor = Colors.grey
                            : iconPassColor = Colors.red;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
