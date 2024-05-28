import 'dart:convert';
import 'package:agendar_sillas/models/Usuarios.dart';
import 'package:http/http.dart' as http;

class FirebaseProvider {
  final String endpoint = "https://cristian8261.pythonanywhere.com/api";

  Map<String, dynamic>? toJson<T>(UsuarioModel object) {
    // ignore: unnecessary_null_comparison
    if (object != null) {
      return object.toJson();
    } else {
      return null;
    }
  }

  Future<String> createUsuario(UsuarioModel data) async {
    try {
      final url = "$endpoint/registrarUsuario";
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode(data.toJson()),
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
  
  // Implementa los demás métodos según sea necesario
}














/*import 'dart:convert';
import 'package:agendar_sillas/models/Usuarios.dart';
import 'package:http/http.dart' as http;
 // Asegúrate de importar la clase Usuario

class FirebaseProvider {
  final String _endpoint =
      "https://alquilersillas-10-default-rtdb.firebaseio.com/Usuario.json";

  Map<String, dynamic>? toJson<T>(UsuarioModel object) {
    // ignore: unnecessary_null_comparison
    if (object != null) {
      return object.toJson();
    } else {
      return null;
    }
  }

  Future<bool> createUsuario(UsuarioModel usuario) async {
    try {
      final url = Uri.parse(_endpoint);
      final response = await http.post(
        url,
        body: jsonEncode(usuario.toJson()),
      );

      if (response.statusCode == 200) {
        return true; // Registro exitoso
      } else {
        throw Exception("Error creating usuario: ${response.statusCode}");
      }
    } catch (e) {
      return false;
    }
  }
}*/
