import 'package:flutter/material.dart';
import 'package:plantapp/Screens/Home/components/list_element.dart';
import 'package:plantapp/Screens/Home/components/topbar.dart';
import 'package:plantapp/components/navbar.dart';
import 'package:plantapp/plantapi/models.dart';
import 'package:plantapp/plantapi/utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Plant> plants = Utils.getMockedPlants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TopBar(),
              Expanded(
                child: ListView.builder(
                  itemCount: plants.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return ListElement(plant: plants[index]);
                  },
                ),
              ),
            ],
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
