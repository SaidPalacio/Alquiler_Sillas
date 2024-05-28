import 'package:agendar_sillas/Providers/categorias_provider.dart';
import 'package:agendar_sillas/models/Sillas.dart';
import 'package:agendar_sillas/widgets/ResultadosBusquedaPage.dart';
import 'package:agendar_sillas/widgets/Filtro_sillas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/sillas_provider.dart';

class Categoriewidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sillasProvider = Provider.of<SillasProvider>(context);
    final sillas = sillasProvider.sillas;
    final categoriasProvider = Provider.of<CategoriaProvider>(context);
    final categorias = categoriasProvider.categorias;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categorias.map((categoria) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    List<Silla_1> sillasFiltradas = Filtrosillas.filtrarSillasPorCategoria(sillas, categoria.nombre);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultadosBusquedaPage(sillas: sillasFiltradas)),
                    );
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset(
                        categoria.imagenes,
                        height: MediaQuery.of(context).size.width * 0.09,
                        width: MediaQuery.of(context).size.width * 0.09, 
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01), 
                TextButton(
                  onPressed: () {
                    List<Silla_1> sillasFiltradas = Filtrosillas.filtrarSillasPorCategoria(sillas, categoria.nombre);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultadosBusquedaPage(sillas: sillasFiltradas)),
                    );
                  },
                  child: Text(
                    categoria.nombre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.04, 
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

