import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tienda_con_delivery/src/pages/client/product/list/clien_product_list_controller.dart';
import 'package:tienda_con_delivery/src/utils/my_colors.dart';

class ClientProductsListPage extends StatefulWidget {
  const ClientProductsListPage({super.key});

  @override
  State<ClientProductsListPage> createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {

  final ClientProductsListController _con = ClientProductsListController();

  @override
  void initState() {
    
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key:_con.key,
      appBar:AppBar(
        leading:_menuDrawer(),
      ),
      drawer: _drwawer(),
      body: Center(
        child: ElevatedButton(   
          onPressed: _con.logout,       
          child: Text('Cerrar Sesion'),
          
        ) ,
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
                Text(_con.user.email,
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
          ListTile(
            title: Text('Editar Perfil'),
            trailing: Icon(Icons.edit_outlined),            
          ),
          ListTile(
            title: Text('Mis Pedidos'),
            trailing: Icon(Icons.add_shopping_cart_outlined),            
          ),
          ListTile(
            title: Text('Seleccionar Rol'),
            trailing: Icon(Icons.person_outline),            
          ),
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