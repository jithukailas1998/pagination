import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> loginData(String email, String pass) async {
  Map<String, dynamic> body = {"email": "$email", "password": "$pass"};
  String myurl = "https://reqres.in/api/login";
  final res = await http.post(myurl,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: json.encode(body));

  print(res.body);
  print(res.statusCode);
  Map<String, dynamic> conData = jsonDecode(res.body);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', conData['token']);
  if (res.statusCode == 200) {
    return true;
  }
  return false;
}

