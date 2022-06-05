import 'package:flutter/material.dart';
import 'package:plantapp/Screens/Loading/components/background.dart';


class LoadingScreen extends StatelessWidget {
  final String text;

  const LoadingScreen({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Container(
          width: double.infinity,
          height: size.height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.3,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.1),
                child: SizedBox(
                  width: size.width * 0.3,
                  height: size.width * 0.3,
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    strokeWidth: size.width * 0.02,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}