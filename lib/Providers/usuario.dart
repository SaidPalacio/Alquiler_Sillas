import 'dart:convert';
import 'package:agendar_sillas/data/Usuarios.dart';
import 'package:http/http.dart' as http;
 // Asegúrate de importar la clase Usuario

class FirebaseProvider {
  final String _endpoint =
      "https://alquilersillas-10-default-rtdb.firebaseio.com/Usuario.json";

  Map<String, dynamic>? toJson<T>(UsuarioModel object) {
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
}
