import 'package:agendar_sillas/models/Sillas.dart';

class Filtrosillas {
  static List<Silla_1> filtrarSillasPorCategoria(
      List<Silla_1> listaSillas, String categoria) {
    // Filtrar las sillas que pertenecen a la categoría especificada
    List<Silla_1> sillasFiltradas = listaSillas
        .where((silla) => silla.categoria.toLowerCase() == categoria.toLowerCase())
        .toList();
    return sillasFiltradas;
  }
}
