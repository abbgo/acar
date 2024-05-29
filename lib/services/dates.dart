import 'dart:convert';

import 'package:acar/helpers/static_data.dart';
import 'package:acar/models/dates.dart';
import 'package:http/http.dart' as http;

class DatesApiService {
  Future<List<Dates>> fetchFiles(String token) async {
    final Uri uri = Uri.parse('$apiUrl/data/files.json');

    try {
      http.Response response = await http.get(
        uri,
        headers: {'Authorization': token},
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        var list = jsonData as List;
        return list.map<Dates>((propJson) => Dates.fromJson(propJson)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
