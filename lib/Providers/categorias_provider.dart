import 'package:agendar_sillas/models/categoria_model.dart';
import 'package:flutter/material.dart';
import '../Http/leer_categoria.dart';


class CategoriaProvider extends ChangeNotifier {
  final leercategorias _categoriasProvider = leercategorias();
  
  List<categoria> _categorias = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<categoria> get categorias => _categorias;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchCategorias() async {
    try {
      _isLoading = true;
      _categorias = await _categoriasProvider.fetchCategoria();
      _isLoading = false;
      _errorMessage = '';
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Error al obtener las categotias: $e';
    }
    notifyListeners();
  }
}
