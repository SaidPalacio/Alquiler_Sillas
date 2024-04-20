import 'package:agendar_sillas/models/Sillas.dart';
import 'package:flutter/material.dart';
import '../Http/leer_sillas.dart';


class SillasProvider extends ChangeNotifier {
  final leersillas _sillasProvider = leersillas();
  
  List<Silla_1> _sillas = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Silla_1> get sillas => _sillas;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchSillas() async {
    try {
      _isLoading = true;
      _sillas = await _sillasProvider.fetchSillas();
      _isLoading = false;
      _errorMessage = '';
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Error al obtener las sillas: $e';
    }
    notifyListeners();
  }
}
