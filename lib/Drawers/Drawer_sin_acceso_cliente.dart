import 'package:flutter/material.dart';

import '../Inicio_seccion.dart';

class Drawer_sin_Acceso_cliente extends StatelessWidget {
  const Drawer_sin_Acceso_cliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
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
                    bottom: 30,
                  ), //left:,top:,right:,bottom:
                  child: CircleAvatar(
                    backgroundColor: Colors
                        .black38, // Color para indicar que no tiene acceso
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ingresa a tu cuenta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Podrás alquilar y tener una',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      softWrap: true,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'mejor experiencia.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      softWrap: true,
                    ),
                    SizedBox(height: 13),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Inicio_seccion()
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .black38, // Cambia el color de fondo del botón
                        textStyle: TextStyle(
                            color: Colors
                                .white), // Cambia el color del texto del botón
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 60,
                        ), // Ajusta el tamaño del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0), // Ajusta el radio de borde del botón
                        ),
                      ),
                      child: Text(
                        'Ingresar',
                        style: TextStyle(
                            fontSize:
                                18), // Ajusta el tamaño del texto del botón
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Opción 1'),
            onTap: () {
              // Acción de la opción 1
            },
          ),
          ListTile(
            title: Text('Opción 2'),
            onTap: () {
              // Acción de la opción 2
            },
          ),
          // Agrega más ListTile para otras opciones del menú
        ],
      ),
    );
  }
}
