import 'dart:convert';
import 'package:agendar_sillas/models/categoria_model.dart';
import 'package:http/http.dart' as http;

class categoria_provider {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Categorias.json";
  
  Future<void> guardarSilla(categorias categoria) async {
    try {
      final url = Uri.parse(_endpoint);
      final response = await http.post(
        url,
        body: jsonEncode(categoria.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception("Error al guardar la categoria");
      }
    } catch (e) {
      throw Exception("Error al guardar la categoria: $e");
    }
  }
}
