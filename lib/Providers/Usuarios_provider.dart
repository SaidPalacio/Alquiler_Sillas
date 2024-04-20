import 'package:agendar_sillas/Http/leer_usuarios_clientes.dart';
import 'package:agendar_sillas/models/Usuarios.dart';
import 'package:flutter/material.dart';


class UsuariosProvider extends ChangeNotifier {
  final leerusuarios _usuariosProvider = leerusuarios();
  
  List<UsuarioModel> _usuarios = [];
  bool _isLoading = false;
  String _errorMessage = '';
  
  List<UsuarioModel> get usuarios => _usuarios;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchUsuarios() async {
    try {
      _isLoading = true;
      _usuarios = await _usuariosProvider.fetchUsuario();
      _isLoading = false;
      _errorMessage = '';
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Error al obtener los usuarios: $e';
    }
    notifyListeners();
  }
}
