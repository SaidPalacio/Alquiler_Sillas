import 'dart:convert';
import 'package:agendar_sillas/models/categoria_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// sin token
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



// con token
class leercategorias_2 {
  final String _endpoint = "https://cristian8261.pythonanywhere.com/api/Obtenercategorias"; 

  Future<List<categoria>> fetchCategoria() async {
    try {
      // Obtener el token de SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('jwt_token');

      if (token == null) {
        throw Exception('Token not found');
      }

      // Realizar la solicitud HTTP con el token en las cabeceras
      final response = await http.get(
        Uri.parse(_endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

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


