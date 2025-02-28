import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tienda_con_delivery/src/register/regster_controller.dart';
import 'package:tienda_con_delivery/src/utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _con = RegisterController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -60,
              left: -90,
              child: _circleRegister(),
            ),
            Positioned(
              top: 50,
              left: 15,
              child: _textRegister(),
            ),
            Positioned(
              top: 40,
              left: -10,
              child: _iconBack(),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 80),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _imageAvatar(),
                    SizedBox(height: 30),
                    _textFieldEmail(),
                    _textFieldNombre(),
                    _textFieldApellido(),
                    _textFieldTelefono(),
                    _textFieldEmailPassword(),
                    _textFieldRepeatPassword(),
                    _buttonRegistrarse(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonRegistrarse() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          _con.register();
        },
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
        child: Text('Registrarse'),
      ),
    );
  }

  Widget _textFieldEmailPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacity,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController, // Usa el controlador para la contraseña
        decoration: InputDecoration(
          hintText: 'Password o contraseña',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.lock,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _textFieldRepeatPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacity,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: true,
        controller: _con.confirmPasswordController, // Usa el controlador para confirmar contraseña
        decoration: InputDecoration(
          hintText: 'Repeat Password',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.lock,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacity,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _con.emailController, // Usa el controlador para el email
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.email,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _textFieldNombre() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacity,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _con.nameController, // Usa el controlador para el nombre
        decoration: InputDecoration(
          hintText: 'Nombre',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.person,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _textFieldApellido() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacity,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _con.lastnameController, // Usa el controlador para el apellido
        decoration: InputDecoration(
          hintText: 'Apellido',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.person_3_outlined,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _textFieldTelefono() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacity,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: _con.phoneController, // Usa el controlador para el teléfono
        decoration: InputDecoration(
          hintText: 'Número de teléfono',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: Icon(
            Icons.phone,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _imageAvatar() {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _iconBack() {
    return IconButton(
      onPressed: () {
        // Lógica para retroceder
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    );
  }

  Widget _circleRegister() {
    return Container(
      width: 200,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor,
      ),
    );
  }

  Widget _textRegister() {
    return Text(
      'REGISTER',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        fontFamily: 'NimbusSans',
      ),
    );
  }
}
