import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Http/Iniciars.dart';
import '../models/categoria_model.dart';



class Categoria_Provider {
  final String _endpoint = "https://cristian8261.pythonanywhere.com/api/registrarCategoria";
  final AuthProvider _authProvider = AuthProvider();

  Future<void> guardarCategoria(categoria categoria) async {
    try {
      final token = await _authProvider.getToken();
      if (token == null) {
        throw Exception("No token found");
      }

      final url = Uri.parse(_endpoint);
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(categoria.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception("Error al guardar la categoría");
      }
    } catch (e) {
      throw Exception("Error al guardar la categoría: $e");
    }
  }
}
