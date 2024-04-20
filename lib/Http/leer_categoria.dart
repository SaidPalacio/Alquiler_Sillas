import 'dart:convert';
import 'package:agendar_sillas/models/categoria_model.dart';
import 'package:http/http.dart' as http;

class leercategorias {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Categorias.json";
  
  Future<List<categoria>> fetchCategoria() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data.entries.map((entry) {
          final categoriaData = entry.value as Map<String, dynamic>;
          return categoria.fromJson(categoriaData);
        }).toList();
      } else {
        throw Exception('Failed to load categorias');
      }
    } catch (e) {
      throw Exception('Error fetching categorias: $e');
    }
  }
}
