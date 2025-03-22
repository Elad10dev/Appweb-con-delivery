import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tienda_con_delivery/src/moldels/response_api.dart';
import 'package:tienda_con_delivery/src/moldels/user.dart';
import 'package:tienda_con_delivery/src/provider/users_provider.dart';
import 'package:tienda_con_delivery/src/utils/my_snackbar.dart';
import 'package:tienda_con_delivery/src/utils/share_pref.dart';

class LoginController {

  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();
  SharedPref _sharedPref = SharedPref();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);

    User user = User.fromJson(await _sharedPref.read('user') ?? {});

    if (user.sessionToken != null) {
      if (user.roles.length > 1) {
        // Si el usuario tiene más de un rol, redirige a la página de roles
        Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
      } else {
        // Si el usuario tiene un solo rol, redirige a la ruta de ese rol
        Navigator.pushNamedAndRemoveUntil(context, user.roles[0].route, (route) => false);
      }
    }
  }
  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() async {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  // Verifica que email y password no estén vacíos
  if (email.isEmpty || password.isEmpty) {
    MySnackbar.show(context!, "Por favor, completa todos los campos.");
    return;
  }

  // Llamada al provider
  ResponseApi? responseApi = await usersProvider.login(email, password);

  // Mostrar mensaje del servidor
  MySnackbar.show(context!, responseApi?.message ?? "Error desconocido.");

  print('Respuesta completa: ${responseApi?.toJson()}');
  print('Objeto ResponseApi: $responseApi');

  // Verifica si `data` contiene información válida
  if (responseApi != null && responseApi.data != null) {
    try {
      // Aquí verificamos si `responseApi.data` es un mapa directo
      Map<String, dynamic> userJson;

      if (responseApi.data is Map<String, dynamic>) {
        userJson = responseApi.data as Map<String, dynamic>;
      } else {
        userJson = json.decode(responseApi.data!); // Sólo si es String
      }

      // Crear el objeto `User` desde el JSON
      User user = User.fromJson(userJson);

      // Guardar los datos del usuario en Shared Preferences
      // ignore: await_only_futures
      // Eliminar `await` si `save` no es asincrónico
      _sharedPref.save('user', user.toJson());


      // Redirigir a la página principal
      // Verificar la cantidad de roles
      if (user.roles.length > 1) {
        // Si el usuario tiene más de un rol, redirige a la página de roles
        Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
      } else {
        // Si el usuario tiene un solo rol, redirige a la ruta de ese rol
        Navigator.pushNamedAndRemoveUntil(context!, user.roles[0].route, (route) => false);
      }
      } catch (e) {
      print('Error al procesar los datos: $e');
      MySnackbar.show(context!, "Error al procesar los datos del usuario.");
      }
      } else {
        print('Error: El campo data está vacío o es nulo');
        MySnackbar.show(context!, 'No se recibió información del servidor.');
      }
    }


}