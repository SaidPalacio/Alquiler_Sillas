import 'package:agendar_sillas/Http/leer_proveedores.dart';
import 'package:agendar_sillas/models/Usuarios.dart';
import 'package:flutter/material.dart';


class ProveedoresProvider extends ChangeNotifier {
  final leerproveedores _proveedoresProvider = leerproveedores();
  
  List<UsuarioModel> _proveedores = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<UsuarioModel> get proveedores => _proveedores;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchproveedores() async {
    try {
      _isLoading = true;
      _proveedores = await _proveedoresProvider.fetchprovee();
      _isLoading = false;
      _errorMessage = '';
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Error al obtener las proveedores: $e';
    }
    notifyListeners();
  }
}
