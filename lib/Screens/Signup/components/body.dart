import 'package:flutter/material.dart';
import 'package:plantapp/Screens/Login/login_screen.dart';
import 'package:plantapp/Screens/Signup/components/background.dart';
import 'package:plantapp/Screens/Signup/signup_screen.dart';
import 'package:plantapp/components/account_check.dart';
import 'package:plantapp/components/animations/change_screen.dart';
import 'package:plantapp/components/rounded_button.dart';
import 'package:plantapp/components/rounded_input_field.dart';
import 'package:plantapp/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({
    Key? key,
    required this.child,
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
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              child: Image.asset(
                "assets/images/signup_center.png",
                width: size.width * 0.5,
              ),
            ),
            RoundedInputField(
              hintText: "Your username",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Repeat password",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "REGISTER",
              press: () {},
            ),
            AccountCheck(
              login: false,
              press: () {
                Navigator.pushReplacement(context, goToLoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
