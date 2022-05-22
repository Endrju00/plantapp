import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = cPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: SizedBox(
        height: size.height * cMainButtonHeightFactor,
        width: size.width * cMainButtonWidthFactor,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: press,
          child: Text(text, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
