import 'package:flutter/material.dart';
import 'package:tienda_con_delivery/src/moldels/user.dart';
import 'package:tienda_con_delivery/src/utils/share_pref.dart';

class ClientProductsListController{

  late BuildContext context;
  final SharedPref _sharedPref = SharedPref();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  late Function refresh;
  late User user;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user') ?? {});
    print('Usuario cargado: ${user.toJson()}');
    refresh();
  }
  void logout(){
    _sharedPref.logout(context);
  }

  void openDrawer() {
    key.currentState?.openDrawer();
  }

  void gotToRoles(){
    Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
  }

}