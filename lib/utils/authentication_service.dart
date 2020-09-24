import 'dart:convert';
import 'dart:io';
import 'package:flora/models/user.dart';
import 'package:flora/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class AuthenticationService {

  Future<String> login(String email, String password) async {
    String url = Constants.URL_BASE + Constants.SERVER_API + 'login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"email": "$email", "password": "$password"}';
    try {
      http.Response response = await http.post(url, headers: headers, body: json);
      int statusCode = response.statusCode;
      if (statusCode != 200) {
        return null;
      }
      var body = response.body;
      Map<String, dynamic> map = jsonDecode(body);
      return map['token'];
    } catch (e) {
      return null;
    }
  }

  Future<bool> isAuthenticated(String token) async {
    String url = Constants.URL_BASE + Constants.SERVER_API + 'user';
    Map<String, String> headers = {"Authorization": "Bearer $token"};
    try {
      http.Response response = await http.get(url, headers: headers).timeout(Duration(seconds: 2));
      return response.statusCode == HttpStatus.ok;
    } catch (e) {
      return false;
    }
  }
}