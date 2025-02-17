main() {
  String name = "Joey";
  String hello = "Hello $name";

  int age = 30;

  List<String> participants = ["Nick", "Thomas", "Fleur", "Martijn", "Lasse"];

  Map<String, Object?> grades = {
    "Pietje": 10,
  };

  /// https://github.com/FlutterJoey/flutter_basic_feb_2025

  int? optionalValue = null;

  var record = ('first', a: 2, b: true, 'last');

  optionalValue ??= 1;
  optionalValue ??= 2;

  print(optionalValue);

  print(participants[2]);
  print(hello);
  print(grades["Pietje"]);
  print(record.b);
}
