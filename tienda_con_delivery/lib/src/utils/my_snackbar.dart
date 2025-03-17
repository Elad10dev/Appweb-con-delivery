// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:tienda_con_delivery/src/utils/my_colors.dart';

class MySnackbar {
  static void show(BuildContext context, String message) {
    if(context == null) return;

    FocusScope.of(context).requestFocus(FocusNode());
    
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style:TextStyle(
            color: Colors.white,
            fontSize:14
          ),
          ),
        backgroundColor: MyColors.primaryColor,
        duration: Duration(seconds: 3),
        )
      
    );

  }
}