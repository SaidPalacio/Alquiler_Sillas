import 'package:agendar_sillas/Pages/Cliente.dart';
import 'package:agendar_sillas/models/Sillas.dart';
import 'package:agendar_sillas/widgets/ResultadosBusquedaPage.dart';
import 'package:flutter/material.dart';

class SearchSillasDelegate extends SearchDelegate {
  final List<Silla_1> listaSillas;

  SearchSillasDelegate({required this.listaSillas});

  @override
  String get searchFieldLabel => "Buscar silla";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget ?buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => cliente()
        ),
        );
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(query);
  }

  Widget _buildSearchResults(String query) {
    if (query.isEmpty) {
      return ResultadosBusquedaPage(sillas: listaSillas);
    }

    // Filtrar las sillas que coincidan con la consulta
    List<Silla_1> sillasFiltradas = listaSillas.where((silla) {
      return silla.nombre.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // Mostrar las sillas filtradas en una página de resultados
    return ResultadosBusquedaPage(sillas: sillasFiltradas);
  }

}
