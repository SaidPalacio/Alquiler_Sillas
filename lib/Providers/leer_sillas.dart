import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendar_sillas/models/Sillas.dart';

class leersillas {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Sillas.json";
  
  Future<List<Silla_1>> fetchSillas() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data.entries.map((entry) {
          final sillaData = entry.value as Map<String, dynamic>;
          return Silla_1.fromJson(sillaData);
        }).toList();
      } else {
        throw Exception('Failed to load sillas');
      }
    } catch (e) {
      throw Exception('Error fetching sillas: $e');
    }
  }
}
