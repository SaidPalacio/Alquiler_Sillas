import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/*class FirebaseProvider {
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

  Future<bool> signIn(String email, String password,String nombreusuario,int idusuario) async {
    final usuarios = await _firebaseProvider.fetchUsuarios();
    final usuario = usuarios.values.firstWhere((user) => user['correo'] == email && user['contrasena'] == password, orElse: () => null);
    if (usuario != null) {
      // Guardar el estado de la sesión en SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('cliente', true);
      prefs.setString('correo', email);
      prefs.setString('pin', password);
      prefs.setString('nombre', nombreusuario);
      prefs.setInt('idusuario', idusuario);
    }
    
    return usuario != null;
  }
}*/





//--------------------------------------------------------------
class AuthService {
  final String _baseUrl = 'https://cristian8261.pythonanywhere.com/api/'; 

  Future<bool> signIn(String correo, String contrasena) async {
  try {
    final url = Uri.parse('$_baseUrl/loginproveedores');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'correo': correo, 'contrasena': contrasena}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      print(token);
      // Guardar token en SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);
      await prefs.setInt('provee_id', data['provee_id']);
      await prefs.setBool('provee', true);
      
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('Error en signIn: $e');
    return false;
  }
}
}
//_----------------------------------

//........................................................
class AuthService_2 {
  final String _baseUrl = 'https://cristian8261.pythonanywhere.com/api/'; 

  Future<bool> signIn(String correo, String contrasena) async {
    final url = Uri.parse('$_baseUrl/loginusuarios');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'correo': correo, 'contrasena': contrasena}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final String token = data['token'];
      print(token);
      // Guardar token en SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);
      await prefs.setInt('cliente_id', data['cliente_id']);
      await prefs.setBool('cliente', true);
      
      return true;
    } else {
      return false;
    }
  }
}

//...............................................................















/*
class AuthProvider {
  final String _loginEndpoint = "https://cristian8261.pythonanywhere.com/api/loginproveedores";

  Future<bool> signIn_2(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_loginEndpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['access_token'];
        print("token guardado");

        // Guardar el token en SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwt_token', token);
        prefs.setString('email', email);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token');
  }
}

class AuthenticationService_2 {
  final AuthProvider _authProvider = AuthProvider();

  Future<bool> signIn_2(String email, String password) async {
    final success = await _authProvider.signIn_2(email, password);

    if (success) {
      final prefs = await SharedPreferences.getInstance();
        prefs.setBool('provee', true);
      return true;
    } else {
      return false;
    }
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

  Future<bool> signIn_2(String email, String password,String nombreproveedor,int idusuario) async {
    final proveedores = await _firebaseProvider_2.fetchProveedores();
    final proveedor = proveedores.values.firstWhere((prov) => prov['correo'] == email && prov['contrasena'] == password, orElse: () => null);

    if (proveedor != null) {
      // Guardar el estado de la sesión en SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('provee', true);
      prefs.setString('correo', email);
      prefs.setString('pin', password);
      prefs.setString('nombre', nombreproveedor);
      prefs.setInt('idusuario', idusuario);
    }
    return proveedor != null;
  }
}*/



