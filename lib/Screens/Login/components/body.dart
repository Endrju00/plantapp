import 'package:flutter/material.dart';
import 'package:plantapp/Screens/Login/components/background.dart';
import 'package:plantapp/components/rounded_input_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: size.height * 0.2),
            child: const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
          )
        ],
      ),
    );
  }
}
