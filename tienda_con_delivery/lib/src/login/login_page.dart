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
    return Container(
      margin: EdgeInsets.only(
        top: 100,
        bottom: MediaQuery.of(context).size.height * 0.2),
      child: Image.asset('assets/img/delivery.png',
              height: 200,
              width: 200,
              ),
    );
  }
  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50 , vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacity,
        borderRadius: BorderRadius.circular(30), 
      ),
      child: TextField(
                decoration: InputDecoration(
                  hintText: 'Correo electronico o numero de telefono',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(
                    color: MyColors.primaryColorDark
                    ),
                  prefixIcon: Icon(
                    Icons.email, 
                    color: MyColors.primaryColor,
                    )
                ),
              ),
    );
  }
  Widget _textFieldEmailPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacity,
        borderRadius: BorderRadius.circular(30), 
      ),
      child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password o contraseña ',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(
                    color: MyColors.primaryColorDark
                    ),
                  prefixIcon: Icon(
                    Icons.lock, 
                    color: MyColors.primaryColor,
                    )
                ),
              ),
    );
  }

  Widget _buttonIngresar(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,        
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),          
            side: BorderSide(
              color: Color.fromARGB(255, 0, 0, 0),
              style: BorderStyle.solid,
              width: 2,
              
            ),          
          ),
          padding: EdgeInsets.symmetric(vertical: 5),
      
          ), 
        child: Text('Iniciar Sesion'),
        ),
    );
      
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


