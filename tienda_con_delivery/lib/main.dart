import 'package:flutter/material.dart';
import 'package:tienda_con_delivery/src/pages/client/product/list/clien_product_list_page.dart';
import 'package:tienda_con_delivery/src/pages/delivery/orders/list/delivery_order_list_page.dart';
import 'package:tienda_con_delivery/src/pages/login/login_page.dart';
import 'package:tienda_con_delivery/src/pages/register/register.dart';
import 'package:tienda_con_delivery/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:tienda_con_delivery/src/pages/roles/roles_page.dart';
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
        'client/products/list': (BuildContext context) => const ClientProductsListPage(),
        'delivery/orders/list': (BuildContext context) => const DeliveryOrdersListPage(),
        'restaurant/orders/list': (BuildContext context) => const RestaurantOrdersListPage(),
        'roles': (BuildContext context) => const RolesPage(),
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
