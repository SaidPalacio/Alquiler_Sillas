import 'package:agendar_sillas/Pages/Cliente.dart';
import 'package:agendar_sillas/Pages/Eliminar_silla.dart';
import 'package:agendar_sillas/widgets/AgregarSilla.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/AgregarCategoria.dart';

class draweradmi extends StatefulWidget {
  const draweradmi({super.key});

  @override
  State<draweradmi> createState() => _draweradmiState();
}

class _draweradmiState extends State<draweradmi> {
  @override
  void initState() {
    super.initState();
  }
  Future<void> borrardatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    /*prefs.remove('pin');
    prefs.remove('correo');
    prefs.remove('isLoggedIn');
    */
    prefs.clear();
  }
  Future<List<String>> recuperardatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt_token');
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      // Suponiendo que el claim que contiene el nombre se llama 'nombre'
      String nombre = decodedToken['nombre'];
      String correo = decodedToken['correo'];
      return [nombre,correo];
    }
    return [];
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: recuperardatos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          String correoUsuario = snapshot.data?[1] ?? "";
          String nombreUsuario = snapshot.data?[0] ?? "";

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
                  title: const Text('Agregar Silla'),
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
                  title: const Text('Eliminar Silla'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  Eliminar_Silla(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Agregar Categoria'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  categoriawidget(),
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