import 'package:flutter/material.dart';
import 'package:tienda_con_delivery/src/utils/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Container(        
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _imageBanner(),
            _textFieldEmail(),
            _textFieldEmailPassword(),
            _buttonIngresar(),
            _noTienesCuenta(),            
          ],
        ),
      ),
    );
  }
  Widget _imageBanner() {
    return Image.asset('assets/img/delivery.png',
            height: 200,
            width: 200,
            );
  }
  Widget _textFieldEmail(){
    return TextField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            );
  }
  Widget _textFieldEmailPassword(){
    return TextField(
              decoration: InputDecoration(
                hintText: 'Contraseña',
              ),
            );
  }

  Widget _buttonIngresar(){
    return ElevatedButton(onPressed: () {}, child: Text('Iniciar Sesion'));
  }

  Widget _noTienesCuenta(){
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('No tienes cuenta?',
                  style: TextStyle(
                    color: MyColors.primaryColor, 
                    ),
                  ),
              SizedBox(width: 10,),
              TextButton(
                onPressed: () {}, 
                child: Text(
                  'Registrate',
                  style: TextStyle(
                    color: MyColors.primaryColor, 
                    fontWeight: FontWeight.bold),
                    ),
                    ),
            ]);
  }
}


