import 'dart:convert';
import 'package:http/http.dart' as http;

class Starwars {
  final String name;
  final String height;
  final String mass;
  // tambahkan properti lainnya sesuai kebutuhan

  Starwars({
    required this.name,
    required this.height,
    required this.mass,
    // tambahkan properti lainnya sesuai kebutuhan
  });

  factory Starwars.fromJson(Map<String, dynamic> json) {
    return Starwars(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      // tambahkan properti lainnya sesuai kebutuhan
    );
  }
}

