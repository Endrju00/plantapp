import 'package:flutter/material.dart';
import 'package:plantapp/Screens/Login/components/background.dart';
import 'package:plantapp/Screens/Signup/signup_screen.dart';
import 'package:plantapp/components/account_check.dart';
import 'package:plantapp/components/animations/change_screen.dart';
import 'package:plantapp/components/rounded_button.dart';
import 'package:plantapp/components/rounded_input_field.dart';
import 'package:plantapp/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.01),
              child: Image.asset(
                "assets/images/login_center.png",
              ),
            ),
            RoundedInputField(
              hintText: "Your username",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            AccountCheck(
              press: () {
                Navigator.pushReplacement(context, goToSignupScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
