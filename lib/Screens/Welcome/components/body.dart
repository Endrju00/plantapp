import 'package:flutter/material.dart';
import 'package:plantapp/Screens/Welcome/components/background.dart';
import 'package:plantapp/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Size of screen
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height * 0.2),
          const Text(
            "WELCOME TO PLANT APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Image.asset(
            "assets/images/main_center.png",
          ),
          SizedBox(height: size.height * 0.05),
          SizedBox(
            height: size.height * cMainButtonHeightFactor,
            width: size.width * cMainButtonWidthFactor,
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(cPrimaryColor),
              ),
              onPressed: () {},
              child: const Text("LOGIN", style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: size.height * 0.015),
          SizedBox(
            height: size.height * cMainButtonHeightFactor,
            width: size.width * cMainButtonWidthFactor,
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(cPrimaryLightColor),
              ),
              onPressed: () {},
              child:
                  const Text("REGISTER", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
