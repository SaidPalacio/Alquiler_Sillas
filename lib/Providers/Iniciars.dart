import 'dart:convert';
import 'package:http/http.dart' as http;

class FirebaseProvider {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Usuario.json";
  
  Future<Map<String, dynamic>> fetchUsuarios() async {
    final response = await http.get(Uri.parse(_endpoint));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load usuarios');
    }
  }
}

class AuthenticationService {
  final FirebaseProvider _firebaseProvider = FirebaseProvider();

  Future<bool> signIn(String email, String password) async {
    final usuarios = await _firebaseProvider.fetchUsuarios();
    final usuario = usuarios.values.firstWhere((user) => user['correo'] == email && user['contrasena'] == password, orElse: () => null);

    return usuario != null;
  }
}

