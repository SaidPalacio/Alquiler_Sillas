import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> signIn(String email, String password,String nombreusuario) async {
    final usuarios = await _firebaseProvider.fetchUsuarios();
    final usuario = usuarios.values.firstWhere((user) => user['correo'] == email && user['contrasena'] == password, orElse: () => null);
    if (usuario != null) {
      // Guardar el estado de la sesión en SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('cliente', true);
      prefs.setString('correo', email);
      prefs.setString('pin', password);
      prefs.setString('nombre', nombreusuario);
    }
    
    return usuario != null;
  }
}

class FirebaseProvider_2 {
  final String _endpoint = "https://alquilersillas-10-default-rtdb.firebaseio.com/Proveedor.json";
  
  Future<Map<String, dynamic>> fetchProveedores() async {
    final response = await http.get(Uri.parse(_endpoint));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load usuarios');
    }
  }
}

class AuthenticationService_2 {
  final FirebaseProvider_2 _firebaseProvider_2 = FirebaseProvider_2();

  Future<bool> signIn_2(String email, String password,String nombreproveedor) async {
    final proveedores = await _firebaseProvider_2.fetchProveedores();
    final proveedor = proveedores.values.firstWhere((prov) => prov['correo'] == email && prov['contrasena'] == password, orElse: () => null);

    if (proveedor != null) {
      // Guardar el estado de la sesión en SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('provee', true);
      prefs.setString('correo', email);
      prefs.setString('pin', password);
      prefs.setString('nombre', nombreproveedor);
    }
    return proveedor != null;
  }
}



