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

    if (user?.sessionToken != null) {
      Navigator.pushReplacementNamed(context, 'client/products/list');
    }
  }
  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi? responseApi = await usersProvider.login(email, password);
    MySnackbar.show(context!,responseApi!.message);

    print('Respuesta: ${responseApi?.toJson()}');
    print('Respuesta object: ${responseApi}'); 

    if (responseApi.data != null) {
    // Decodifica el JSON contenido en `data`
    final Map<String, dynamic> userJson = json.decode(responseApi.data!);

    // Ahora puedes usar `userJson` para crear el usuario
    User user = User.fromJson(userJson);

    // Guarda los datos del usuario
    _sharedPref.save('user', user.toJson());

    // Redirige al usuario a la página de productos
    Navigator.pushReplacementNamed(context!, 'client/products/list');
    } else {
      print('Error: El campo data está vacío o es nulo');
      MySnackbar.show(context!, 'Error al procesar los datos del usuario.');
    }      
  }
}