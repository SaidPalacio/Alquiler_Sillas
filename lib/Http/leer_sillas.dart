import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendar_sillas/models/Sillas.dart';

class leersillas {
  final String _endpoint = "https://cristian8261.pythonanywhere.com/api/Obtenersillas";
  
  Future<List<Silla_1>> fetchSillas() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((sillaData) => Silla_1.fromJson(sillaData)).toList();
      } else {
        throw Exception('Failed to load sillas');
      }
    } catch (e) {
      throw Exception('Error fetching sillas: $e');
    }
  }
}

class leersillas_2 {
  final String _endpoint = "https://cristian8261.pythonanywhere.com/api/Obtenersillas"; 

  Future<List<Silla_1>> fetchSillas() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((sillaData) => Silla_1.fromJson(sillaData)).toList();
      } else {
        throw Exception('Failed to load sillas');
      }
    } catch (e) {
      throw Exception('Error fetching sillas: $e');
    }
  }
}

