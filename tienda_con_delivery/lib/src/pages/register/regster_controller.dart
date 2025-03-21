
import 'package:flutter/material.dart';
import 'package:tienda_con_delivery/src/moldels/response_api.dart';
import 'package:tienda_con_delivery/src/moldels/user.dart';
import 'package:tienda_con_delivery/src/provider/users_provider.dart';
import 'package:tienda_con_delivery/src/utils/my_snackbar.dart';

class RegisterController {

  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  Future init(BuildContext context) async {
    this.context = context;
    usersProvider.init(context);
  }

  void register() async {
  String email = emailController.text.trim();
  String name = nameController.text.trim();
  String lastname = lastnameController.text.trim();
  String phone = phoneController.text.trim();
  String password = passwordController.text.trim();
  String confirmPassword = confirmPasswordController.text.trim();

  if (email.isEmpty || name.isEmpty || lastname.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    MySnackbar.show(context!, "Porfavor ingresa datos faltantes..!! ✨");
    return;
  }

  if (confirmPassword != password) {
    MySnackbar.show(context!, "Las contraseñas no coinciden..!! 🚫");
    return;
  }

  if (password.length < 6) {
    MySnackbar.show(context!, "La contraseña debe tener al menos 6 caracteres..!! ❌");
    return;
  }

  User user = User(
    email: email, 
    name: name, 
    lastname: lastname, 
    phone: phone, 
    password: password,
  );

  ResponseApi? responseApi = await usersProvider.create(user);

  if (responseApi != null) {
    print('responseApi.success: ${responseApi.success}');
    if (responseApi.success) {
      print('Redirigiendo a login...');
      MySnackbar.show(context!, responseApi.message);
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context!, 'login');
      });
    } else {
      print('Error: ${responseApi.message}');
      MySnackbar.show(context!, "Error: ${responseApi.message}");
    }
  } else {
    MySnackbar.show(context!, "Error inesperado al conectar con el servidor.");
  }




    print('RESPUESTA: ${responseApi?.toJson()}'); 

   
  }

  void back() {
    Navigator.pop(context!);
  }
}