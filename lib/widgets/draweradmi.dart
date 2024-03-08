import 'package:agendar_sillas/widgets/AgregarSilla.dart';
import 'package:flutter/material.dart';

class draweradmi extends StatelessWidget {
  const draweradmi({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('ADMINISTRADOR'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: const Text('AGREGAR SILLA'),
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>  const agregarsilla(),
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}