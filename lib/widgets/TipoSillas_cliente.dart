import 'package:agendar_sillas/Providers/leer_sillas.dart';
import 'package:agendar_sillas/models/Sillas.dart';
import 'package:agendar_sillas/widgets/SillasItem.dart';
import 'package:flutter/material.dart';

class Tipo_sillas_cliente extends StatefulWidget {
  const Tipo_sillas_cliente({super.key});

  @override
  State<Tipo_sillas_cliente> createState() => _Tipo_sillas_clienteState();
}

class _Tipo_sillas_clienteState extends State<Tipo_sillas_cliente> {
  leersillas leesillas = leersillas();
  List<Silla_1> sillas = [];
  @override
  void initState() {
    super.initState();
    cargarSillasDesdeFirebase();
  }
  Future<void> cargarSillasDesdeFirebase() async {
    try {
      List<Silla_1> sillasDesdeFirebase = await leesillas.fetchSillas();
      setState(() {
        sillas = sillasDesdeFirebase;
      });
    } catch (e) {
      print('Error al cargar las sillas desde Firebase: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.blue[300],
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: sillas.length,
            itemBuilder: (context, index) {
              return SillaItem(silla: sillas[index]);
            },
          ),
        ),
      ],
    );
  }
}
