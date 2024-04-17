import 'package:agendar_sillas/Drawers/draweradmi.dart';
import 'package:agendar_sillas/widgets/TipoSillas_cliente.dart';
import 'package:agendar_sillas/Drawers/Drawer_sin_acceso_cliente.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agendar_sillas/widgets/HomeAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Drawers/Drawer_con_acceso_cliente.dart'; // Asegúrate de importar el archivo correcto

Future<List<bool>> recuperardatos() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool cliente = prefs.getBool('cliente') ?? false;
  bool provee = prefs.getBool('provee') ?? false;

  return [cliente, provee];
}

class cliente extends StatefulWidget {
  const cliente({Key? key});

  @override
  State<cliente> createState() => _clienteState();
}

class _clienteState extends State<cliente> {
  Future<List<bool>> ingreso = recuperardatos();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: FutureBuilder<List<bool>>(
          future: recuperardatos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              List<bool>? data = snapshot.data;
              if (data != null && data.isNotEmpty) {
                bool cliente = data[0];
                bool provee = data[1];
                if (cliente) {
                  return Drawer_con_acceso_cliente();
                } else if (provee) {
                  return draweradmi();
                } else {
                  return Drawer_sin_Acceso_cliente();
                }
              } else {
                return Drawer_sin_Acceso_cliente(); // Por defecto, si no hay datos, muestra el drawer sin acceso
              }
            }
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HomeAppBar(),
                    Tipo_sillas_cliente(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


/*
class cliente extends StatefulWidget {
  const cliente({Key? key});

  @override
  State<cliente> createState() => _clienteState();
}

class _clienteState extends State<cliente> {
  Future<bool> ingreso = recuperardatos();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: FutureBuilder<bool>(
          future: ingreso,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              bool isLoggedIn = snapshot.data ?? false;
              return isLoggedIn ? Drawer_con_acceso_cliente() : Drawer_sin_Acceso_cliente();
            }
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HomeAppBar(),
                    Tipo_sillas_cliente(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

*/
