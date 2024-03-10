
class UsuarioModel {
  final String contrasena;
  final String correo;
  final String direccion;
  final int idUsuario;
  final String nombre;
  final String telefono;

  UsuarioModel({
    required this.contrasena,
    required this.correo,
    required this.direccion,
    required this.idUsuario,
    required this.nombre,
    required this.telefono,
  });

  Map<String, dynamic> toJson() {
    return {
      "contrasena": contrasena,
      "correo": correo,
      "direccion": direccion,
      "idUsuario": idUsuario,
      "nombre": nombre,
      "telefono": telefono,
    };
  }
}

