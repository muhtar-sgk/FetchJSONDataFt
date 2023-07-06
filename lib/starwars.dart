class Starwars {
  final String name;
  final String hairColor;
  final String skinColor;

  const Starwars({
    required this.name,
    required this.hairColor,
    required this.skinColor,
  });

  factory Starwars.fromJson(Map<String, dynamic> json) {
    return Starwars(
      name: json['name'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
    );
  }
}