import 'dart:convert';

import 'package:eco/core/const/database_constanse.dart';
import 'package:eco/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel model = await _getUserData();
      if (model == null) {
        return null;
      }
      return model;
    } catch (e) {
      print(e.toString());
    }
  }

  setUser(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(CASHED_USER_DATA, jsonEncode(model.toJson()));
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CASHED_USER_DATA);
    return UserModel.fromJson(jsonDecode(value!));
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
