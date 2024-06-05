import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/reserva_model.dart';

class leerreserva {
  final String _endpoint =
      "https://cristian8261.pythonanywhere.com/api/ObtenerReservas"; // Cambia esto al endpoint correcto

  Future<List<reserva>> fetchreserva() async {
    
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? idUsuario = prefs.getInt('cliente_id');
      String? token = prefs.getString('jwt_token');

      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse('$_endpoint?idusuario=$idUsuario'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((reservaData) => reserva.fromJson(reservaData)).toList();
      } else {
        throw Exception('Failed to load reservas');
      }
    } catch (e) {
      throw Exception('Error fetching reserva: $e');
    }
  }
}
