
class UsuarioModel {
  final String contrasena;
  final String correo;
  final String direccion;
  final int idUsuario;
  final String nombre;
  final String telefono;
  final String apellido;

  UsuarioModel({
    required this.contrasena,
    required this.correo,
    required this.direccion,
    required this.idUsuario,
    required this.nombre,
    required this.telefono,
    required this.apellido,
  });

  Map<String, dynamic> toJson() {
    return {
      "contrasena": contrasena,
      "correo": correo,
      "direccion": direccion,
      "idUsuario": idUsuario,
      "nombre": nombre,
      "telefono": telefono,
      "apellido": apellido,
    };
  }
  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      contrasena: json['contrasena'] ?? '',
      correo: json['correo'] ?? '',
      direccion: json['direccion'] ?? '',
      idUsuario: json['idUsuario'] ?? 0,
      nombre: json['nombre'] ?? '',
      telefono: json['telefono'] ?? '',
      apellido: json['apellido'] ?? '',
    );
  }
}

