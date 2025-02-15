import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Delivery App'),
        backgroundColor: const Color.fromARGB(255, 166, 255, 0),
        
      ),
      body: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromARGB(255, 166, 255, 0),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60,left: 60),
            child: 
            Text('Login'),
            ),
        ],
      ),
    );
  }
}

/*
Column(
        children: [
          SizedBox(height: 20),          
          Text('Este es el txto nro 1'),          
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Descripcion',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Text('Aceptar'),
          ),
        ],
      ),
 */