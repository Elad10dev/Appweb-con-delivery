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

  Future<ResponseApi?> create(User user) async {
  try {
    Uri url = Uri.http(_url, '$_api/create');

    Map<String, dynamic> userData = user.toJson();
    userData.forEach((key, value) {
      if (value == null) {
        userData[key] = ''; // Reemplaza valores nulos con cadenas vacías
      }
    });

    String bodyParams = json.encode(userData);
    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    final res = await http.post(url, headers: headers, body: bodyParams);

    print('Respuesta del servidor: ${res.body}');

    if (res.statusCode == 200 || res.statusCode == 201) {
      // Decodificar la respuesta JSON del servidor
      final data = json.decode(res.body);
      json.decode(res.body);

// Validar si "sucess" está presente y corregirlo
      if (data.containsKey('success')) {
         data['success'] = data['success']; // Copia el valor de "sucess" a "success"
          data.remove('success'); // Elimina la clave incorrecta
        }


      // Reemplaza la clave incorrecta (temporal)
      if (data.containsKey('success')) {
        data['success'] = data['success']; // Copia el valor de 'success' a 'success'
        data.remove('success'); // Elimina la clave incorrecta
      }

      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } else {
      print('Error en la solicitud: Código ${res.statusCode}');
      return ResponseApi(
        success: false,
        message: 'Error en el servidor',
        data: null,
        error: 'Error HTTP ${res.statusCode}',
      );
    }
  } catch (e) {
    print('Error: $e');
    return ResponseApi(
      success: false,
      message: 'Error inesperado al conectar con el servidor.',
      data: null,
      error: e.toString(),
    );
  }
}



  Future<ResponseApi?> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      print("Error: Campos de email o contraseña vacíos.");
      return ResponseApi(
        success: false,
        message: "Datos incompletos",
        error: '400',
        data: null,
      );
    }

    try {
      // Construcción de la URL
      Uri url = Uri.http(_url, '$_api/login');
      print("URL generada: $url"); // Log de la URL generada

      // Cuerpo de la solicitud
      String bodyParams = json.encode({
        'email': email,
        'password': password,
      });

      // Encabezados HTTP
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      // Solicitud POST
      final res = await http.post(url, headers: headers, body: bodyParams);

      print("Estado de la respuesta: ${res.statusCode}"); // Log del estado

      // Manejo de respuesta
      if (res.statusCode == 200 || res.statusCode == 201) {
        print("Respuesta exitosa: ${res.body}");
        final data = json.decode(res.body);
        return ResponseApi.fromJson(data);
      } else if (res.statusCode == 404) {
        print("Error: Endpoint no encontrado.");
        return ResponseApi(
          success: false,
          message: "Ruta no encontrada en el servidor.",
          error: '404',
          data: null,
        );
      } else if (res.statusCode >= 500) {
        print("Error: Problema del servidor.");
        return ResponseApi(
          success: false,
          message: "Problema en el servidor (${res.statusCode}).",
          error: '${res.statusCode}',
          data: null,
        );
      } else {
        print("Respuesta inesperada: ${res.body}");
        return ResponseApi(
          success: false,
          message: "Error desconocido (${res.statusCode}).",
          error: '${res.statusCode}',
          data: null,
        );
      }
    } catch (e) {
      print("Error: $e");
      return ResponseApi(
        success: false,
        message: "Error al conectar con el servidor.",
        error: '500',
        data: null,
      );
    }
  }
}