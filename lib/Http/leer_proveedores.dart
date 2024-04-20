import 'dart:convert';
import 'package:agendar_sillas/models/Usuarios.dart';
import 'package:http/http.dart' as http;

class leerproveedores {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Proveedor.json";
  
  Future<List<UsuarioModel>> fetchprovee() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data.entries.map((entry) {
          final proveedata = entry.value as Map<String, dynamic>;
          return UsuarioModel.fromJson(proveedata);
        }).toList();
      } else {
        throw Exception('Failed to load provee');
      }
    } catch (e) {
      throw Exception('Error fetching provee: $e');
    }
  }
}