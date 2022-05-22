import 'package:flutter/material.dart';
import 'package:plantapp/components/text_field_container.dart';
import 'package:plantapp/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: cPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: cPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}