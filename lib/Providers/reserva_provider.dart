import 'package:agendar_sillas/Http/leer_reservas.dart';
import 'package:agendar_sillas/models/reserva_model.dart';
import 'package:flutter/material.dart';


class ReservaProvider extends ChangeNotifier {
  final leerreserva _reservasProvider = leerreserva();
  
  List<reserva> _reservas = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<reserva> get reservas => _reservas;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchreservas() async {
    try {
      _isLoading = true;
      _reservas = await _reservasProvider.fetchreserva();
      _isLoading = false;
      _errorMessage = '';
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Error al obtener las reservas: $e';
    }
    notifyListeners();
  }
}
