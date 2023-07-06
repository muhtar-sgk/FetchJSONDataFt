import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fetch_json_data/starwars.dart';

class Repository {
  final _baseUrl = "https://swapi.dev/api/people";

  Future fetchPeople() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        Iterable iterable = jsonDecode(response.body);
        List<Starwars> starwars = iterable.map((json) => Starwars.fromJson(json)).toList();
        return starwars;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}