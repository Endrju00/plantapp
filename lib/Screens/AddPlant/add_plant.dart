import 'package:flutter/material.dart';
import 'package:plantapp/Screens/AddPlant/components/background.dart';
import 'package:plantapp/components/rounded_button.dart';
import 'package:plantapp/components/rounded_input_field.dart';
import 'package:plantapp/components/text_field_container.dart';
import 'package:plantapp/constants.dart';

class AddPlant extends StatefulWidget {
  const AddPlant({Key? key}) : super(key: key);

  @override
  State<AddPlant> createState() => _AddPlantState();
}

class _AddPlantState extends State<AddPlant> {
  final _waterAmountController = TextEditingController();
  final _insolationController = TextEditingController();
  final _worldDirectionController = TextEditingController();
  final _humidityController = TextEditingController();
  final _wateringPeriodController = TextEditingController();
  final _wateringAmountController = TextEditingController();
  final _additionalRemarksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  'Plant conditions',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            RoundedInputField(
              hintText: 'Water amount (ml)',
              icon: Icons.water,
              controller: _waterAmountController,
              onChanged: (value) {},
            ),
            TextFieldContainer(
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      enabled: false,
                      controller: _insolationController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.sunny,
                          color: cPrimaryColor,
                        ),
                        hintText: 'Insolation',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    items: <String>['Sunny places', 'Shady places']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _insolationController.text = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            TextFieldContainer(
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      enabled: false,
                      controller: _worldDirectionController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.north,
                          color: cPrimaryColor,
                        ),
                        hintText: 'World direction',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    items: <String>['North', 'South', 'West', 'East']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _worldDirectionController.text = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            TextFieldContainer(
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      enabled: false,
                      controller: _humidityController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.cloud,
                          color: cPrimaryColor,
                        ),
                        hintText: 'Humidity',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    items: <String>['Dry places', 'Wet places']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _humidityController.text = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            RoundedInputField(
              hintText: 'Watering period (days)',
              icon: Icons.timelapse,
              controller: _wateringPeriodController,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: 'How many times?',
              icon: Icons.timeline,
              controller: _wateringAmountController,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: 'Additional remarks',
              icon: Icons.question_answer,
              controller: _additionalRemarksController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'Next',
              press: () {},
            ),
          ],
        ),
      )),
    );
  }
}
