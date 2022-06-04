import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:plantapp/Screens/Signup/components/background.dart';
import 'package:plantapp/components/account_check.dart';
import 'package:plantapp/components/animations/change_screen.dart';
import 'package:plantapp/components/rounded_button.dart';
import 'package:plantapp/components/rounded_input_field.dart';
import 'package:plantapp/components/rounded_password_field.dart';
import 'package:plantapp/plantapi/models.dart';

class Body extends StatefulWidget {
  final Widget child;

  const Body({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future<User>? _futureUser;

  Future<User> signIn(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('https://water-plant-api.herokuapp.com/users/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'email': email
      }),
    );

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {

      Map<String, dynamic> json = jsonDecode(response.body);
      List username = json['username'] ?? [];
      List email = json['email'] ?? [];
      List password = json['password'] ?? [];

      if (username.isNotEmpty) {
        throw Exception('Username: ${username[0]}');
      } else if (email.isNotEmpty) {
        throw Exception('Email: ${email[0]}');
      } else if (password.isNotEmpty) {
        throw Exception('Password: ${password[0]}');
      } else {
        throw Exception('Failed to create an account.');
      }
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
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/images/signup_center.png",
              width: size.width * 0.45,
            ),
            Container(
              child: (_futureUser == null)
                  ? buildEmptyText()
                  : buildFutureBuilder(),
            ),
            RoundedInputField(
              controller: _usernameController,
              hintText: "Your username",
              onChanged: (value) {},
            ),
            RoundedInputField(
              controller: _emailController,
              hintText: "Your email",
              icon: Icons.email,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: _passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "REGISTER",
              press: () {
                setState(() {
                  _futureUser = signIn(_usernameController.text,
                      _emailController.text, _passwordController.text);
                });
              },
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

  Text buildEmptyText() {
    return const Text('');
  }

  FutureBuilder<User> buildFutureBuilder() {
    return FutureBuilder<User>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Text(
            'Account has been created!',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          );
        } else if (snapshot.hasError) {
          return Text(
            '${snapshot.error}'.replaceAll('Exception: ', ''),
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          );
        }
        return const CircularProgressIndicator(
          color: Colors.green,
        );
      },
    );
  }
}
