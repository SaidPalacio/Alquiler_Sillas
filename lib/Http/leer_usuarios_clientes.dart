import 'dart:convert';
import 'package:agendar_sillas/models/Usuarios.dart';
import 'package:http/http.dart' as http;

class leerusuarios {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Usuario.json";
  
  Future<List<UsuarioModel>> fetchUsuario() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data.entries.map((entry) {
          final usuarioData = entry.value as Map<String, dynamic>;
          return UsuarioModel.fromJson(usuarioData);
        }).toList();
      } else {
        throw Exception('Failed to load usuario');
      }
    } catch (e) {
      throw Exception('Error fetching usuario: $e');
    }
  }
}
