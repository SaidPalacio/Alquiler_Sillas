import 'package:agendar_sillas/data/Data.dart';
import 'package:agendar_sillas/widgets/SillasItem.dart';
import 'package:flutter/material.dart';

class Tipo_sillas_cliente extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.blue[300],
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Lógica para filtrar por sillas de bodas
                },
                child: Text('Sillas para Bodas'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para filtrar por sillas de fiestas
                },
                child: Text('Sillas para Fiestas'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para filtrar por sillas de grados
                },
                child: Text('Sillas para Grados'),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: listaSillas.length,
            itemBuilder: (context, index) {
              return SillaItem(silla: listaSillas[index]);
            },
          ),
        ),
      ],
    );
  }
}
