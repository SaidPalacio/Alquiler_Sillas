import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendar_sillas/models/Sillas.dart';

class FirebaseProvider_3 {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Sillas.json";
  
  Future<void> guardarSilla(Silla_1 silla) async {
    try {
      final url = Uri.parse(_endpoint);
      final response = await http.post(
        url,
        body: jsonEncode(silla.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception("Error al guardar la silla");
      }
    } catch (e) {
      throw Exception("Error al guardar la silla: $e");
    }
  }
}
