import 'package:agendar_sillas/delegates/search_sillas_delegate.dart';
import 'package:agendar_sillas/widgets/Categoriewidget.dart';
import 'package:agendar_sillas/widgets/SillasItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/sillas_provider.dart';

class Tipo_sillas_cliente extends StatefulWidget {
  const Tipo_sillas_cliente({super.key});

  @override
  State<Tipo_sillas_cliente> createState() => _Tipo_sillas_clienteState();
}

class _Tipo_sillas_clienteState extends State<Tipo_sillas_cliente> {
  @override
  Widget build(BuildContext context) {
    final sillasProvider = Provider.of<SillasProvider>(context);
    final sillasList = sillasProvider.sillas;

    
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
                    delegate: SearchSillasDelegate(listaSillas: sillasList),
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 90,
                  child: TextButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchSillasDelegate(listaSillas: sillasList),
                  );          //Boton de busqueda
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0), // Eliminar la sombra
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors
                            .transparent; // Color transparente cuando se presiona
                      }
                      return Colors
                          .transparent; // Manejar el caso cuando no se presiona
                    },
                  ),
                ),
                child: Text(
                  "Buscar silla",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )),
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
