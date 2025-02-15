import 'package:flutter/material.dart';
import 'package:tienda_con_delivery/src/login/login_page.dart';

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
        'login': (BuildContext context) => LoginPage(),
      } ,
      theme: ThemeData(
        primarySwatch:  Colors.lightGreen,
      ),
    );
  }
}