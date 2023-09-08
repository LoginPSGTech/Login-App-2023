import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:login/models/auth.dart';
import 'package:login/utils/preferences.dart';

class APIException implements Exception {
  String message;

  APIException({this.message = "API error"});
}

class UnauthorizedException implements APIException {
  @override
  String message = "Unauthorized";
}

class APIWrapper {
  static Future<Map<String, String>> getHeaders() async {
    String accessToken = await UserPreferences.getToken(TokenType.access);
    return {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
    };
  }

  static Future<Map<String, dynamic>> parseResponse(http.Response response) async {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw APIException();
    }
  }

  static Future<Map<String, dynamic>> get(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: await getHeaders());
    return parseResponse(response);
  }

  static Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body) async {
    http.Response response = await http.post(Uri.parse(url), headers: await getHeaders(), body: jsonEncode(body));
    return parseResponse(response);
  }
}
