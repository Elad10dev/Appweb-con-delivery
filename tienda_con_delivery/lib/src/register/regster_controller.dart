
import 'package:flutter/material.dart';

class RegisterController {

  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future init(BuildContext context) async {
    this.context = context;
  }

  void register() {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print(email);
    print(name);    
    print(lastname);    
    print(phone);    
    print(password);    
    print(confirmPassword);
  }
}