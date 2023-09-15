import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:login/models/auth.dart';
import 'package:login/utils/preferences.dart';

class ApiException implements Exception {
  String message;

  ApiException({this.message = "API error"});
}

class AuthException implements ApiException {
  @override
  String message = "Unauthorized";
}

class ApiWrapper {
  static Future<Map<String, String>> getHeaders(bool authenticate) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
    };
    if (authenticate) {
      String accessToken = await UserPreferences.getToken(TokenType.access);
      headers[HttpHeaders.authorizationHeader] = "Bearer $accessToken";
    }
    return headers;
  }

  static Future<Map<String, dynamic>> parseResponse(http.Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      throw AuthException();
    } else {
      String error = "Unexpected error occurred";
      Map<String, dynamic> errorResponse = jsonDecode(response.body);
      List<dynamic> value = errorResponse.values.toList();
      if (value.isNotEmpty) {
        if (value[0] is List && value[0].isNotEmpty && value[0][0] is String) {
          error = value[0][0];
        } else if (value[0] is String) {
          error = value[0];
        }
      }
      throw ApiException(message: error);
    }
  }

  static Future<Map<String, dynamic>> get(String url, {bool authenticate = false}) async {
    http.Response response = await http.get(Uri.parse(url), headers: await getHeaders(authenticate));
    return parseResponse(response);
  }

  static Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body, {bool authenticate = false}) async {
    http.Response response =
        await http.post(Uri.parse(url), headers: await getHeaders(authenticate), body: jsonEncode(body));
    return parseResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String url, {bool authenticate = false}) async {
    http.Response response = await http.delete(Uri.parse(url), headers: await getHeaders(authenticate));
    return parseResponse(response);
  }
}
