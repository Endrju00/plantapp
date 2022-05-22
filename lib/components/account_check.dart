import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  final Function() press;

  const AccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: size.height * 0.01),
          child: Text(
            login ? "Don't have an Account? " : "Already have an account? ",
            style: const TextStyle(
              color: cPrimaryColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.01),
            child: Text(
              login ? "Sign Up" : "Sign In",
              style: const TextStyle(
                color: cPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
