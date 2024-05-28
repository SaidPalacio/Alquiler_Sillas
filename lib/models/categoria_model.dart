class categoria {
  String imagenes;
  String nombre;

  categoria({
    required this.imagenes,
    required this.nombre,
  });

  Map<String, dynamic> toJson() {
    return {
      'imagenes': imagenes,
      'nombre': nombre,
    };
  }
  factory categoria.fromJson(Map<String, dynamic> json) {
    return categoria(
      imagenes: json['imagenes'] ?? '',
      nombre: json['nombre'] ?? '',
    );
  }

}
