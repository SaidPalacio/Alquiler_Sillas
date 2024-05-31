import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/reserva_model.dart';

class reserva_provi {
  Future<void> guadar_reserva(reserva reserva) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt_token');
    
    if (token != null) {
      final url = Uri.parse('https://cristian8261.pythonanywhere.com/api/registrarReserva');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'idusuario': reserva.idusuario,
          'idsilla': reserva.idsilla,
          'nombre': reserva.nombre,
          'categoria':reserva.categoria,
          'descripcion': reserva.descripcion,
          'precio': reserva.precio,
          'promocion':reserva.promocion,
          'imagenes': reserva.imagenes,
          'cantidad': reserva.cantidad
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('reserva guardada exitosamente');
      } else {
        print('Error al guardar la reserva: ${response.body}');
      }
    } else {
      print('Token no encontrado');
    }
  }
}
