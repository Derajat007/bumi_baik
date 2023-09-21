import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_bumi_baik/models/user_model.dart';
import 'package:new_bumi_baik/resources/app_constants.dart';
import 'package:new_bumi_baik/resources/token.dart';
import 'package:http/http.dart' as http;

class UserService {
  String userUrl = "${AppConstants.apiUrl}/users";

  Future<UserModel> getUserDetails() async {
    String url = userUrl;

    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-control': 'no-cache',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];

        return UserModel.fromJson(data);
      } else {
        print(response.statusCode);
        throw Exception("ehe");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  void putUser(UserModel updateUser) async {
    // UserModel updateUser = UserModel();
    String url = userUrl;

    print(url);

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-control': 'no-cache',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
          // 'Authorization': 'Bearer $globalAccessToken',
        },
        body: jsonEncode(
          updateUser.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        print("Masuk");
      } else {
        print('eror');
      }

      // if (response.statusCode == 200) {
      //   var data = jsonDecode(response.body)['data'];

      //   //  UserModel.fromJson(data);
      // } else {
      //   print(response.statusCode);
      //   throw Exception("ehe");
      // }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
