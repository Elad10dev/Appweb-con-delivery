import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tienda_con_delivery/src/pages/delivery/orders/list/delivery_ordes_list_controller.dart';
import 'package:tienda_con_delivery/src/utils/my_colors.dart';

class DeliveryOrdersListPage extends StatefulWidget {
  const DeliveryOrdersListPage({super.key});

  @override
  State<DeliveryOrdersListPage> createState() => _DeliveryOrdersListPageState();
}

class _DeliveryOrdersListPageState extends State<DeliveryOrdersListPage> {
  final DeliveryOrdersListController _con = DeliveryOrdersListController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        leading: _menuDrawer(),
        ),
      drawer: _drwawer(),
      body: Center(
        child: Text('DELIVERY ORDERS LIST PAGE'),
      ),
    );
  }
  Widget _menuDrawer(){
    return GestureDetector(
      onTap: _con.openDrawer,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Image.asset('assets/img/menu.png', width: 20, height: 20,)

      ),
    );
  }

  Widget _drwawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, ${_con.user.lastname}, ${_con.user.name}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                maxLines: 1,
                ),
                Text('${_con.user.lastname},${_con.user.name}',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
                maxLines: 1,
                ),
                Text(_con.user.phone,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
                maxLines: 1,
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(top: 5),
                  child: FadeInImage(
                    image: 
                    _con.user.image != null ? NetworkImage(_con.user.image!) :
                      AssetImage('assets/img/no-image.png'),
                    fit: BoxFit.contain,
                    fadeInDuration: Duration(milliseconds: 50),
                    placeholder:AssetImage('assets/img/no-image.png') ,
                  ),
                ),       
                
            ],),
          ),
          
          // ignore: unnecessary_null_comparison
          _con.user != null ?
          _con.user.roles.length > 1 ?
          ListTile(
            onTap: _con.gotToRoles,
            title: Text('Seleccionar Rol'),
            trailing: Icon(Icons.person_outline),            
          ) : Container() : Container (),
          ListTile(
            onTap: _con.logout,
            title: Text('Cerrar Sesion'),
            trailing: Icon(Icons.power_settings_new),            
          ),
          
        ],
      ),
    );
  }
  void refresh() {
    setState(() {});
  }
}