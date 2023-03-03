import 'dart:convert';

import 'package:final_matrimony/api/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static const baserURL =
      'https://62da4f4b9eedb699636ae83c.mockapi.io/userlist';

  Future<List<User>?> getData(String api) async {
    var client = http.Client();

    var uri = Uri.parse(baserURL + api);
    print(':::1:::$uri');
    var response = await client.get(uri);
    print(':::2:::${response.body}');
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
  }

  Future<User?> getDataById(String api) async {
    var client = http.Client();

    var uri = Uri.parse(baserURL + api);
    print(':::1:::$uri');
    var response = await client.get(uri);
    print(':::2:::${response.body}');
    if (response.statusCode == 200) {
      var json = response.body;
      return User.fromJson(jsonDecode(json));
    }
    return null;
  }

  Future<void> upsertIntoUserTable(
      {userName, dob, phone, city, gender, isFavorite, UserID}) async {
    Map<dynamic, dynamic> map = {};

    map['UserName'] = userName;
    map['DOB'] = dob;
    map['Phone'] = phone;
    map['City'] = city;
    map['Gender'] = gender;

    print('::::::::USER ID ::::::::${UserID}');
    UserID = int.parse(UserID.toString());

    if (UserID > 0 && UserID != null) {
      var response = putData('/userlist/${UserID}', map).catchError((err) {
        debugPrint('successfull:$err');
      });

      if (response == null) return;
      debugPrint('successfull:edit');
    } else {
      var response = postData('/userlist', map).catchError((err) {
        debugPrint('successfull:$err');
      });

      if (response == null) return;
      debugPrint('successfull:post');
    }
  }

  Future<dynamic> postData(String api, dynamic object) async {
    var payLoad = json.encode(object);
    var _header = {'Content-Type': 'application/json'};
    var client = http.Client();
    var uri = Uri.parse(baserURL + api);
    var response = await client.post(uri, body: payLoad, headers: _header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {}
  }

  Future<List<User>?> putData(String api, dynamic object) async {
    var client = http.Client();
    var payLoad = object;

    var uri = Uri.parse(baserURL + api);
    var response = await client.put(uri, body: payLoad);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print('::::::::VALUE ::::::::${response.body}');
      var json = response.body;
      return userFromJson(json);
    } else {}
  }

  Future<List<User>?> FavData(String api) async {
    var client = http.Client();
    var uri = Uri.parse(baserURL + api);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      print('::::::::VALUE ::::::::${response.body}');
      var json = response.body;
      return userFromJson(json);
    } else {}
  }

  Future<void> updateFav({userId, isfavourite}) async {
    Map<dynamic, dynamic> map = {};

    map['IsFavorite'] = isfavourite;

    userId = int.parse(userId.toString());
    if (userId > 0 && userId != null) {
      var response = await RemoteService()
          .putData('/userlist/$userId', map)
          .catchError((err) {});
      if (response == null) return;
    } else {}
  }

  Future<dynamic> deleteData(String api) async {
    var client = http.Client();
    var uri = Uri.parse(baserURL + api);
    var response = await client.delete(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
  }
}
