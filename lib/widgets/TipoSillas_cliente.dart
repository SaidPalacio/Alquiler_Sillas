import 'package:agendar_sillas/Providers/leer_sillas.dart';
import 'package:agendar_sillas/delegates/search_sillas_delegate.dart';
import 'package:agendar_sillas/models/Sillas.dart';
import 'package:agendar_sillas/widgets/Categoriewidget.dart';
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
    return Container(
      // Temporal
      //height: 500,
      padding: EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
        color: Color(0xFFEDECF2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchSillasDelegate(listaSillas: sillas),
                  );
                },
                icon: Icon(
                  Icons.search, 
                  color: Colors.grey, 
                ),
              ),
              SizedBox(
                width:10
              ), 
              Expanded(
                child: TextFormField(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: SearchSillasDelegate(listaSillas: sillas),
                    );
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Buscar silla", 
                    hintStyle: TextStyle(
                      color: Colors.grey), 
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        // categoria
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: const Text(
            "Categories",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C53A5),
            ),
          ),
        ),
        //categorias widget
        Categoriewidget(),

        //items
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: const Text(
            "Best Selling",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C53A5),
            ),
          ),
        ),
        //Items Widget
        //ItemsWidget(),
        SillaItem(),
      ]),
    );
  }
}
