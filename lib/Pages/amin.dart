import 'package:agendar_sillas/widgets/HomeAppBar.dart';
import 'package:agendar_sillas/widgets/TipoSillas_admin.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class admin extends StatelessWidget {
  const admin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Tipo_sillas_admin()
        ],
      ),
      //ESTO HACE LA BARRA DE ABAJO 
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        onTap: (index){},
        height: 70,
        color: Color(0xFF4C53A5),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}