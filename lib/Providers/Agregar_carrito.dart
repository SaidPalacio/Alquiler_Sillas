import 'dart:convert';

import 'package:agendar_sillas/models/Usuarios.dart';
import 'package:http/http.dart' as http;

import '../models/Sillas.dart';

class Guardarcarrito {
  final String _endpoint =
      "https://alquilersillas-10-default-rtdb.firebaseio.com/Usuario.json";

  Future<List<UsuarioModel>> fetchUsuario() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data.entries.map((entry) {
          final usuarioData = entry.value as Map<String, dynamic>;
          return UsuarioModel.fromJson(usuarioData);
        }).toList();
      } else {
        throw Exception('Failed to load usuario');
      }
    } catch (e) {
      throw Exception('Error fetching usuario: $e');
    }
  }



  Future<void> agregarSillaAlCarrito(String correo, Silla_1 silla) async {
    try {
      // Obtener la lista de usuarios desde Firebase

      final listaUsuarios = await fetchUsuario();
     

      // Buscar el usuario por su correo electrónico
      UsuarioModel? usuarioEncontrado;
      for (UsuarioModel usuario in listaUsuarios) {
        if (usuario.correo == correo) {
          usuarioEncontrado = usuario;
          
          break;
        }
      }

      
    } catch (e) {
      print('Error al agregar silla al carrito: $e');
      throw Exception('Error al agregar silla al carrito: $e');
    }
  }
}









String obtenerNombreUsuarioPorCorreo(String correo, List<UsuarioModel> listaUsuarios) {
  String nombreUsuario = "";
  for (UsuarioModel usuario in listaUsuarios) {
    if (usuario.correo == correo) {
      break; // Salir del bucle una vez que se encuentra el usuario
    }
  }
  return nombreUsuario;
}

class FirebaseProvider_3 {
  final String _endpoint =
      "https://alquilersillas-10-default-rtdb.firebaseio.com/Sillas.json";

  Future<void> guardarSilla(Silla_1 silla) async {
    try {
      final url = Uri.parse(_endpoint);
      final response = await http.post(
        url,
        body: jsonEncode(silla.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception("Error al guardar la silla");
      }
    } catch (e) {
      throw Exception("Error al guardar la silla: $e");
    }
  }
}





/* 
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendar_sillas/models/Usuarios.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseProvider {
  final String _baseUrl = "https://alquilersillas-10-default-rtdb.firebaseio.com";

  Future<UsuarioModel?> obtenerUsuarioPorCorreo(String correo) async {
    try {
      // Obtener la lista de usuarios desde Firebase
      final response = await http.get(Uri.parse("$_baseUrl/Usuario.json"));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // Iterar sobre los usuarios para encontrar el que coincida con el correo
        for (var entry in data.entries) {
          var usuarioData = entry.value as Map<String, dynamic>;
          var usuario = UsuarioModel.fromJson(usuarioData);
          if (usuario.correo == correo) {
            return usuario;
          }
        }
        // Si no se encuentra un usuario con el correo dado, devolver null
        return null;
      } else {
        throw Exception("Error al obtener usuarios de Firebase: ${response.statusCode}");
      }
    } catch (e) {
      print("Error al obtener usuario por correo: $e");
      throw Exception("Error al obtener usuario por correo: $e");
    }
  }

  Future<void> editarNombreUsuario(String nuevoNombre) async {
    try {
      // Obtener el correo del usuario de SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String correo = prefs.getString('correo') ?? "";

      // Obtener el usuario por correo
      UsuarioModel? usuario = await obtenerUsuarioPorCorreo(correo);
      if (usuario != null) {
        // Modificar el nombre del usuario
        usuario.nombre = nuevoNombre;

        // Realizar la solicitud PATCH a Firebase para actualizar el usuario
        String urlUsuario = "$_baseUrl/Usuario/${usuario.idUsuario}.json";
        final response = await http.patch(
          Uri.parse(urlUsuario),
          body: jsonEncode(usuario.toJson()),
        );

        if (response.statusCode == 200) {
          print("Nombre de usuario editado exitosamente");
        } else {
          throw Exception("Error al editar nombre de usuario: ${response.statusCode}");
        }
      } else {
        print("Usuario no encontrado con el correo $correo");
      }
    } catch (e) {
      print("Error al editar nombre de usuario: $e");
      throw Exception("Error al editar nombre de usuario: $e");
    }
  }
}

*/