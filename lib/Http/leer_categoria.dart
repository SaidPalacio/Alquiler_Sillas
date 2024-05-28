import 'dart:convert';
import 'package:agendar_sillas/models/categoria_model.dart';
import 'package:http/http.dart' as http;

class leercategorias {
  final String _endpoint = "https://cristian8261.pythonanywhere.com/api/Obtenercategorias"; 

  Future<List<categoria>> fetchCategoria() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((categoriaData) => categoria.fromJson(categoriaData)).toList();
      } else {
        throw Exception('Failed to load categorias');
      }
    } catch (e) {
      throw Exception('Error fetching categorias: $e');
    }
  }
}

