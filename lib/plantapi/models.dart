class Token {
  final String token;

  const Token({required this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['token']);
  }
}

class User {
  final String username;
  final String email;
  final String password;

  const User(
      {required this.username, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        email: json['email'],
        password: json['password']);
  }
}

class Conditions {
  final int waterAmount;
  final String insolation;
  final String humidity;
  final String worldDirection;
  final int wateringPeriod;
  final int wateringAmount;
  final String additionalRemarks;

  const Conditions(
      {required this.waterAmount,
      required this.insolation,
      required this.humidity,
      required this.worldDirection,
      required this.wateringPeriod,
      required this.wateringAmount,
      required this.additionalRemarks});

  factory Conditions.fromJson(Map<String, dynamic> json) {
    return Conditions(
        waterAmount: json['water_amount'],
        insolation: json['insolation'],
        humidity: json['humidity'],
        worldDirection: json['world_direction'],
        wateringPeriod: json['watering_period'],
        wateringAmount: json['watering_amount'],
        additionalRemarks: json['additional_remarks']);
  }
}

class Plant {
  String name;
  String imgName;
  Conditions? conditions;

  Plant({required this.name, required this.imgName, this.conditions});
}
