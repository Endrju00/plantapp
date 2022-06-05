import 'package:flutter/material.dart';

import 'package:plantapp/Screens/Home/home_screen.dart';
import 'package:plantapp/Screens/Loading/loading_screen.dart';
import 'package:plantapp/Screens/Welcome/welcome_screen.dart';
import 'package:plantapp/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<String>? _futureToken;

  @override
  Widget build(BuildContext context) {
    setState(() {
      _futureToken = getToken();
    });

    return MaterialApp(
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: cPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: buildFutureBuilder(),
      debugShowCheckedModeBanner: false,
    );
  }

  FutureBuilder<String?> buildFutureBuilder() {
    return FutureBuilder<String>(
      future: _futureToken,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else if (snapshot.hasError) {
          return const WelcomeScreen();
        }
        return const LoadingScreen(
          text: 'Logging in...',
        );
      },
    );
  }

  Future<String>? getToken() async {
    final String token;
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1));
    token = prefs.getString('token') ?? "null";

    if (token != "null") {
      return token;
    } else {
      throw Exception('User is not logged in.');
    }
  }
}
