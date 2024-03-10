
class UsuarioModel {
  final String contrasena;
  final String correo;
  final String direccion;
  final int idProveedor;
  final String nombreEmpresa;
  final String telefono;

  UsuarioModel({
    required this.contrasena,
    required this.correo,
    required this.direccion,
    required this.idProveedor,
    required this.nombreEmpresa,
    required this.telefono,
  });

  Map<String, dynamic> toJson() {
    return {
      "contrasena": contrasena,
      "correo": correo,
      "direccion": direccion,
      "idProveedor": idProveedor,
      "nombreEmpresa": nombreEmpresa,
      "telefono": telefono,
    };
  }
}

