import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * cMainButtonWidthFactor,
      height: size.height * cMainButtonHeightFactor,
      decoration: BoxDecoration(
        color: cPrimaryLightColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
