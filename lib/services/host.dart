import 'dart:convert';
import 'package:acar/helpers/static_data.dart';
import 'package:acar/models/host.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HostApiService {
  Future<List<Host>> fetchHostsByFileName(String token, String fileName) async {
    final Uri uri = Uri.parse('$apiUrl/data/$fileName');

    try {
      http.Response response = await http.get(
        uri,
        headers: {'Authorization': token},
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        var list = jsonData as List;
        return list.map<Host>((propJson) => Host.fromJson(propJson)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}

class HostParams extends Equatable {
  final BuildContext? context;
  final String filename;

  const HostParams({required this.context, required this.filename});

  factory HostParams.defaultResult() {
    return const HostParams(context: null, filename: '');
  }

  @override
  List<Object?> get props => [context, filename];
}
