import 'package:flutter/material.dart';
import 'package:tienda_con_delivery/src/utils/share_pref.dart';

class RestaurantOrdersListController{

  late BuildContext context;
  final SharedPref _sharedPref = SharedPref();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  Future init(BuildContext context) async {
    this.context = context;
  }
  void logout(){
    _sharedPref.logout(context);
  }

  void openDrawer() {
    key.currentState?.openDrawer();
  }

}