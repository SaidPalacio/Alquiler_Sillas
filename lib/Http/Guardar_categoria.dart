import 'dart:convert';
import 'package:agendar_sillas/models/categoria_model.dart';
import 'package:http/http.dart' as http;

class Categoria_Provider {
  final String _endpoint = "https://cristian8261.pythonanywhere.com/api/registrarCategoria";
  
  Future<void> guardarCategoria(categoria categoria) async {
    try {
      final url = Uri.parse(_endpoint);
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
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

/*class categoria_provider {
  final String endpoint = "https://cristian8261.pythonanywhere.com/api";
  
  Future<String> guardarSilla(categoria categoria) async {
    try {
      final url = "$endpoint/registrarCategoria";
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode(categoria.toJson()),
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        return "Guardado"; // Indica que el usuario se ha guardado correctamente
      } else {
        throw Exception("Error ${response.statusCode}: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Error $e");
    }
  }
}


 */





/*
class categoria_provider {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Categorias.json";
  
  Future<void> guardarSilla(categoria categoria) async {
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
*/
