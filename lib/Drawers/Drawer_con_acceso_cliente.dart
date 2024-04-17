import 'package:agendar_sillas/Providers/leer_usuarios_clientes.dart';
import 'package:agendar_sillas/widgets/AgregarSilla.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/Cliente.dart';


class Drawer_con_acceso_cliente extends StatefulWidget {
  const Drawer_con_acceso_cliente({super.key});

  @override
  State<Drawer_con_acceso_cliente> createState() => _Drawer_con_acceso_clienteState();
}

class _Drawer_con_acceso_clienteState extends State<Drawer_con_acceso_cliente> {
  leerusuarios leeusuarios = leerusuarios();

  @override
  void initState() {
    super.initState();
  }

  Future<List<String>> recuperardatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String usuario = prefs.getString('correo') ?? "";
    String nombreUsuario = prefs.getString("nombre") ?? "";

    return [usuario, nombreUsuario];
  }
  Future<void> borrardatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    /*prefs.remove('pin');
    prefs.remove('correo');
    prefs.remove('isLoggedIn');
    */
    prefs.clear();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: recuperardatos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          String correoUsuario = snapshot.data?[0] ?? "";
          String nombreUsuario = snapshot.data?[1] ?? "";

          return Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF4C53A5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 0,
                    top: 0,
                    right: 15,
                    bottom: 0,
                  ), //left:,top:,right:,bottom:
                  child: CircleAvatar(
                    backgroundColor: Colors.black38,
                    radius: 30,
                    child: Text(
                      correoUsuario.isNotEmpty ? correoUsuario[0] : "",
                      style: TextStyle(fontSize: 40.0,color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nombreUsuario,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      correoUsuario,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
                ListTile(
                  title: const Text('AGREGAR SILLA'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const agregarsilla(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Cerrar Sesión'),
                  onTap: () {
                    borrardatos();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => cliente()),
                    );
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

/* 

 */
