import 'package:agendar_sillas/models/Sillas.dart';
import 'package:agendar_sillas/widgets/DetallesSilla.dart';
import 'package:flutter/material.dart';

class SillaItem extends StatelessWidget {
  final Silla silla;

  const SillaItem({Key? key, required this.silla}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=>DetalleSilla(silla: silla)
          ),
        );
      },
      child: Card(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                silla.imagenUrl.first,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  silla.nombre,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "precio: ${silla.precio}",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

