import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pagination/models/model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static const int _perPage = 10;

  Future<User> getUsers({
    @required int page,
  }) async {
    try {
      var rsponse = await http.get(
        'https://reqres.in/api/users?page=2&per_page=$_perPage',
      );
      print(rsponse.statusCode); //check 200 , 202 301 404 401 422 500
      print(rsponse.body);
      final users = jsonDecode(rsponse.body);

      User user = User.fromJson(users);

      return user;
    } catch (e) {
      //return e.toString();
    }
  }
}
