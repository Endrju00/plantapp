import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:plantapp/Screens/Login/components/background.dart';
import 'package:plantapp/components/account_check.dart';
import 'package:plantapp/components/animations/change_screen.dart';
import 'package:plantapp/components/rounded_button.dart';
import 'package:plantapp/components/rounded_input_field.dart';
import 'package:plantapp/components/rounded_password_field.dart';
import 'package:plantapp/plantapi/models.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  Future<Token>? _futureToken;

  Future<Token> logIn(String username, String password) async {
    final Token token;
    final prefs = await SharedPreferences.getInstance();

    final response = await http.post(
      Uri.parse('https://water-plant-api.herokuapp.com/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      token = Token.fromJson(jsonDecode(response.body));
      await prefs.setString('token', token.token);
      await Navigator.pushReplacement(context, goToHomeScreen());
      return token;
    } else {
      throw Exception('Failed to login.');
    }
  }

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
            Container(
              child: (_futureToken == null)
                  ? buildEmptyText()
                  : buildFutureBuilder(),
            ),
            RoundedInputField(
              controller: _usernameController,
              hintText: "Your username",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: _passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                FocusScope.of(context).unfocus();
                setState(() {
                  _futureToken =
                      logIn(_usernameController.text, _passwordController.text);
                });
              },
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

  Text buildEmptyText() {
    return const Text('');
  }

  FutureBuilder<Token> buildFutureBuilder() {
    return FutureBuilder<Token>(
      future: _futureToken,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Text(
            'Success!',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          );
        } else if (snapshot.hasError) {
          return const Text(
            "Username or password is wrong :(",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          );
        }
        return const Padding(
          padding: EdgeInsets.only(top: 10, bottom:20),
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        );
      },
    );
  }
}
