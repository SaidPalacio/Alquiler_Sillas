import 'package:agendar_sillas/Providers/leer_categoria.dart';
import 'package:agendar_sillas/Providers/leer_sillas.dart';
import 'package:agendar_sillas/models/Sillas.dart';
import 'package:agendar_sillas/models/categoria_model.dart';
import 'package:agendar_sillas/widgets/ResultadosBusquedaPage.dart';
import 'package:agendar_sillas/widgets/Filtro_sillas.dart';
import 'package:flutter/material.dart';

class Categoriewidget extends StatefulWidget {
  @override
  State<Categoriewidget> createState() => _CategoriewidgetState();
}

class _CategoriewidgetState extends State<Categoriewidget> {
  leercategorias leecategorias = leercategorias();
  List<categorias> categoriasList = [];
  leersillas leesillas = leersillas();
  List<Silla_1> sillas = [];

  @override
  void initState() {
    super.initState();
    cargarcategoriasDesdeFirebase();
    cargarSillasDesdeFirebase();
  }

  Future<void> cargarcategoriasDesdeFirebase() async {
    try {
      List<categorias> categoriasDesdeFirebase =
          await leecategorias.fetchCategoria();
      setState(() {
        categoriasList = categoriasDesdeFirebase;
      });
    } catch (e) {
      print('Error al cargar las categorias desde Firebase: $e');
    }
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoriasList.map((categoria) {
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
                        categoria.imagenes.first,
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

