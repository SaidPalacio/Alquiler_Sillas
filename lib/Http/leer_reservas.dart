import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/reserva_model.dart';


Future<int> recuperardatos() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int idusuario = prefs.getInt('idusuario') ?? 0;
  return idusuario;
}


class leerreserva {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Reserva.json";
  
  Future<List<reserva>> fetchreserva() async {
    int idUsuario= await recuperardatos();
    try {
      final response = await http.get(Uri.parse(_endpoint));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<reserva> reservasLit = [];
        data.entries.forEach((entry) {
          final reservaData = entry.value as Map<String, dynamic>;
          final reservas= reserva.fromJson(reservaData);
          if (reservas.idusuario == idUsuario) {
            reservasLit.add(reservas);
          }
        });
        return reservasLit;
      } else {
        throw Exception('Failed to load reserva');
      }
    } catch (e) {
      throw Exception('Error fetching reserva: $e');
    }
  }
}




 