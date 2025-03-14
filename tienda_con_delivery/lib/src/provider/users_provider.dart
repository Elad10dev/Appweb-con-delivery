import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tienda_con_delivery/src/api/environment.dart';
import 'package:tienda_con_delivery/src/moldels/response_api.dart';
import 'package:tienda_con_delivery/src/moldels/user.dart';
import 'package:http/http.dart' as http;

class UsersProvider {

  final String _url = Enviroment.API_DELIVERY;
  final String _api = '/api/users';

  late BuildContext context;
  Future init(BuildContext context) async {
    this.context = context;
  }

  Future<ResponseApi?> create(User user) async{
      try {
        Uri url = Uri.http(_url, '$_api/create');
        String bodyParams = json.encode(user);
        Map<String, String> headers = {
        'Content-type': 'application/json'
        };

        final res = await http.post(url, headers: headers, body: bodyParams);
        final data = json.decode(res.body);
        ResponseApi responseApi = ResponseApi.fromJson(data);
        return responseApi;

      } catch (e) {
        print('Error: $e');
        return null;
      }
  }
}