import 'package:plantapp/plantapi/models.dart';

class Utils {
  static List<Plant> getMockedPlants() {
    return [
      Plant(
        name: "Epipremnum",
        imgName: "plant1",
      ),
      Plant(
        name: "Monstera",
        imgName: "plant2",
      ),
      Plant(
        name: "Filodendron",
        imgName: "plant3",
      ),
      Plant(
        name: "Fikus",
        imgName: "plant4",
      ),
      Plant(
        name: "Zamiokulkas",
        imgName: "plant5",
      ),
      Plant(
        name: "Syngonium",
        imgName: "plant6",
      )
    ];
  }
}
