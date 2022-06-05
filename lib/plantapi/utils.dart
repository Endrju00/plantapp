import 'package:plantapp/plantapi/models.dart';

class Utils {
  static List<Plant> getMockedPlants() {
    return [
      Plant(
        name: "Roślina 1",
        imgName: "cat1",
      ),
      Plant(
        name: "Roślina 2",
        imgName: "cat2",
      ),
      Plant(
        name: "Roślina 3",
        imgName: "cat3",
      ),
      Plant(
        name: "Roślina 4",
        imgName: "cat4",
      ),
      Plant(
        name: "Roślina 5",
        imgName: "cat5",
      ),
      Plant(
        name: "Roślina 6",
        imgName: "cat6",
      )
    ];
  }
}
