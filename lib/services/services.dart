import 'package:project_mobile/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Repository {
  final String apiUrl =
      "https://klinik-api-87a3c-default-rtdb.firebaseio.com/klinik.json";

  Future<List<klinik>> fetchDataPlaces() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<klinik> dataPlaces;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      dataPlaces = jsonData.values.map((value) {
        return klinik.fromJson(value);
      }).toList();

      return dataPlaces;
    } else {
      throw Exception('Failed to load data places');
    }
  }
}
