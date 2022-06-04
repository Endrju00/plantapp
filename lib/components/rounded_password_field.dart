import 'package:flutter/material.dart';
import 'package:plantapp/components/text_field_container.dart';
import 'package:plantapp/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    this.hintText = "Password", required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          icon: const Icon(
            Icons.lock,
            color: cPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
