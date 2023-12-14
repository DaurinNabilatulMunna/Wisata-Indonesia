import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:project_mobile/models/wisataModel.dart';


class Repository {
  final String apiUrl = "https://project-mobile-d2f13-default-rtdb.asia-southeast1.firebasedatabase.app/wisata/religius.json";

  Future<List<Wisata>> fetchDataPlaces() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<Wisata> dataPlaces;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      dataPlaces = jsonData.values.map((value) {
        return Wisata.fromJson(value);
      }).toList();

      return dataPlaces;
    } else {
      throw Exception('Failed to load data places');
}
}
}