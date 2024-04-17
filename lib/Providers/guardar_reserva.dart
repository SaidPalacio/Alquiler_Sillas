import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/reserva_model.dart';

class reserva_provi {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Reserva.json";
  
  Future<void> guadar_reserva(reserva reserva) async {
    try {
      final url = Uri.parse(_endpoint);
      final response = await http.post(
        url,
        body: jsonEncode(reserva.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception("Error al guardar la reserva");
      }
    } catch (e) {
      throw Exception("Error al guardar la reserva: $e");
    }
  }
}
