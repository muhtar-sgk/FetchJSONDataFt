import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fetch_json_data/starwars.dart';

class Repository {
  final _baseUrl = "https://swapi.dev/api/people";

  Future<List<Starwars>> fetchPeople() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final results = jsonResponse['results'] as List<dynamic>;
      return results.map((json) => Starwars.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch people');
    }
  }
}
