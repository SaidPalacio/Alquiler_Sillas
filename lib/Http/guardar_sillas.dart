import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendar_sillas/models/Sillas.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter/material.dart';

class FirebaseProvider_3 {
  Future<void> guardarSilla(Silla_1 silla) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt_token');
    
    if (token != null) {
      final url = Uri.parse('https://cristian8261.pythonanywhere.com/api/registrarSilla');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'nombre': silla.nombre,
          'categoria':silla.categoria,
          'descripcion': silla.descripcion,
          'imagenes': silla.imagenes,
          'precio': silla.precio,
          'promocion':silla.promocion,
          'cantidad': silla.cantidad
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Silla guardada exitosamente');
      } else {
        print('Error al guardar la Silla: ${response.body}');
      }
    } else {
      print('Token no encontrado');
    }
  }
}







/*
class FirebaseProvider_3 {
  final String endpoint = "https://cristian8261.pythonanywhere.com/api/registrarSilla";
  
  
  Future<void> guardarSilla(Silla_1 silla) async {
    try {
      final url = Uri.parse(endpoint);
      final response = await http.post(
        url,
        headers:<String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(silla.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception("Error al guardar la silla");
      }
    } catch (e) {
      throw Exception("Error al guardar la silla: $e");
    }
  }
}*/

//------------------------------------------------------------------------------------------

/*
class FirebaseProvider_3_1 with ChangeNotifier {
  List<Silla_1> _sillas = [];

  List<Silla_1> get sillas => _sillas;

  Future<void> fetchSillas() async {
    final url = "https://cristian8261.pythonanywhere.com/api/sillas";
    final token = await getToken();
    
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      _sillas = responseData.map((silla) => Silla_1.fromJson(silla)).toList();
      notifyListeners();
    } else {
      throw Exception("Failed to load sillas");
    }
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<void> registrarSilla(Silla_1 silla) async {
    final url = "https://cristian8261.pythonanywhere.com/api/registrarSilla";
    final token = await getToken();

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(silla.toJson()),
    );

    if (response.statusCode == 201) {
      fetchSillas();
    } else {
      throw Exception("Failed to register silla");
    }
  }
}

*/