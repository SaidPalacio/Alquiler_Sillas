import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/reserva_model.dart';

class leerreserva {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Categorias.json";
  
  Future<List<reserva>> fetchreserva() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data.entries.map((entry) {
          final reservadata = entry.value as Map<String, dynamic>;
          return reserva.fromJson(reservadata);
        }).toList();
      } else {
        throw Exception('Failed to load reserva');
      }
    } catch (e) {
      throw Exception('Error fetching reserva: $e');
    }
  }
}
