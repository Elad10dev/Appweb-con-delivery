import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  void save ( String key, value) async{
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, json.encode(value));
  }


Future<dynamic> read(String key) async{
  final pref = await SharedPreferences.getInstance();

  if (pref.getString(key) == null) return null;

  return json.decode(pref.getString(key)!);
}

Future<bool> contains(String key) async{
  final pref = await SharedPreferences.getInstance();
  return pref.containsKey(key);
}

Future<bool> remove(String key) async{
  final pref = await SharedPreferences.getInstance();
  return pref.remove(key);
}

void logout (BuildContext context) async {
  await remove('user');
  // ignore: use_build_context_synchronously
  Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
}

}