import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:tienda_con_delivery/src/pages/login/login_controller.dart';
import 'package:tienda_con_delivery/src/utils/my_colors.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final LoginController _con = LoginController();
  @override
  void initState() {
    // 
    super.initState();
    
    
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(      
      // ignore: sized_box_for_whitespace
      body: Container(        
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -60,
              left: -90,
              child: _circleLogin(),
              ),
              Positioned(
                top:40,
                left:15,
                child: _textLogin(),
                ),
              
            SingleChildScrollView(
              child: Column(
                children: [
                  
                  _imageBanner(),                        
                  _textFieldEmail(),            
                  _textFieldEmailPassword(),            
                  _buttonIngresar(),            
                  _noTienesCuenta(),            
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textLogin(){
    return Text(
      'LOGIN',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontFamily: 'NimbusSans',
      ),
    );
  }
  Widget _circleLogin(){
    return Container(
      width: 200,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor,
      ),

    );
  }
  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
        top: 120,
        bottom: MediaQuery.of(context).size.height * 0.1,),
      child: Lottie.asset('assets/json/Login1.json',
              width: 350, 
              height: 250,
              fit: BoxFit.fill,
              
              ),
    );
  }
  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30 , vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacity,
        borderRadius: BorderRadius.circular(30), 
      ),
      child: TextField(
                controller: _con.emailController,
                keyboardType: TextInputType.emailAddress,
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
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacity,
        borderRadius: BorderRadius.circular(30), 
      ),
      child: TextField(
                controller: _con.passwordController,
                obscureText: true,
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
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: ElevatedButton(
        onPressed: _con.login,
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
              SizedBox(width: 10,),
              GestureDetector(
                onTap: _con.goToRegisterPage,
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


