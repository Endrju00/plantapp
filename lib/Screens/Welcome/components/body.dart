import 'package:flutter/material.dart';
import 'package:plantapp/Screens/Welcome/components/background.dart';
import 'package:plantapp/components/animations/change_screen.dart';
import 'package:plantapp/components/rounded_button.dart';
import 'package:plantapp/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Size of screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: size.height * 0.2),
              child: const Text(
                "WELCOME TO PLANT APP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.05),
              child: Image.asset(
                "assets/images/main_center.png",
              ),
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(context, goToLoginScreen());
              },
            ),
            RoundedButton(
              text: "REGISTER",
              press: () {
                Navigator.push(context, goToSignupScreen());
              },
              color: cPrimaryLightColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
