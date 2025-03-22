import 'package:flutter/material.dart';
import 'package:tienda_con_delivery/src/moldels/user.dart';
import 'package:tienda_con_delivery/src/utils/share_pref.dart';

class Rolescontroller {
  
  late BuildContext context;
  late Function refresh;
  late User user;
  SharedPref sharedPref =  SharedPref();

  Future init(BuildContext context, void Function() refresh) async {
      this.context = context;
      refresh = refresh;
      // obtener el usuario en sesion
      user = User.fromJson(await sharedPref.read('user') ?? {});
      refresh();
  }

  void goToPage( String route){
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

}