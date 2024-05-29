import 'dart:convert';
import 'package:acar/helpers/static_data.dart';
import 'package:acar/models/token.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class TokenApiService {
  Future<Token> fetchToken(TokenParams params) async {
    final Uri uri = Uri.parse('$apiUrl/login');

    final Map<String, String> formData = {
      'code': params.code,
      'device_id': params.deviceID,
    };

    try {
      http.Response response = await http.post(
        uri,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: formData,
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        return Token(msg: jsonData['msg'], token: jsonData['token']);
      }
      return Token(msg: jsonData['msg']);
    } catch (e) {
      rethrow;
    }
  }
}

class TokenParams extends Equatable {
  final String code, deviceID;

  const TokenParams({required this.code, required this.deviceID});

  @override
  List<Object?> get props => [code, deviceID];
}
