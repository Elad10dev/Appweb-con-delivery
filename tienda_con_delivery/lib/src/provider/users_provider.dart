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

  Future<ResponseApi?> login(String email, String password) async {
  if (email.isEmpty || password.isEmpty) {
    print("Error: Campos de email o contraseña vacíos.");
    return ResponseApi(succes: false, message: "Datos incompletos", error: '404', data: null);
  }
  try {
    Uri url = Uri.http(_url, '$_api/login');
    String bodyParams = json.encode({
      'email': email,
      'password': password,
    });
    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    final res = await http.post(url, headers: headers, body: bodyParams);

    if (res.statusCode == 200 || res.statusCode == 201) {
      // Decodifica la respuesta del servidor
      final Map<String, dynamic> data = json.decode(res.body) as Map<String, dynamic>;

      if (data.containsKey("sucess") && data["sucess"] == true) {
        // Extrae la información del usuario dentro de "data"
        if (data.containsKey("data") && data["data"] != null) {
          final userJson = data['data'] as Map<String, dynamic>;
          final user = User.fromJson(userJson);

          // Crea la respuesta final con el usuario
          ResponseApi responseApi = ResponseApi(
            succes: true,
            message: data['message'],
            data: jsonEncode(user.toJson()), // Aquí pasamos el usuario
            error: "null" // No hay error
          );
          
          return responseApi;
        } else {
          print("La respuesta no contiene la información esperada del usuario.");
          return ResponseApi(succes: false, message: "No se encontró información del usuario.", error: '404', data: null);
        }
      } else {
        print("Formato inesperado de respuesta: ${res.body}");
        return ResponseApi(succes: false, message: "Formato de respuesta inválido.", error: '404', data: null);
      }
    } else {
      print("Error: Respuesta del servidor: ${res.statusCode}");
      print("Cuerpo: ${res.body}");
      return ResponseApi(succes: false, message: "Error en el servidor (${res.statusCode}).", error: '404', data: null);
    }
  } catch (e) {
    print('Error: $e');
    return ResponseApi(succes: false, message: "Error al conectar con el servidor.", error: '404', data: null);
  }

  
}





}