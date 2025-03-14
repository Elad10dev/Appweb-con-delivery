import 'package:flutter/material.dart';
import 'package:tienda_con_delivery/src/pages/login/login_page.dart';
import 'package:tienda_con_delivery/src/pages/register/register.dart';
import 'package:tienda_con_delivery/src/utils/my_colors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliveryApp con Flutter', 
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => const LoginPage(),
        'register': (BuildContext context) => const RegisterPage(),
      },
      theme: ThemeData(
        fontFamily: 'dhaelzot',        
        primaryColor: MyColors.primaryColor,
        scaffoldBackgroundColor:Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: MyColors.primaryColor,
        ),
      ),
      
    );
  }
  
}
