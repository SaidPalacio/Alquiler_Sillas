class categoria {
  String nombre;
  List<String> imagenes;

  categoria({
    required this.nombre,
    required this.imagenes,
  });

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'imagenes': imagenes,
    };
  }
  factory categoria.fromJson(Map<String, dynamic> json) {
    return categoria(
      nombre: json['nombre'] ?? '',
      imagenes: List<String>.from(json['imagenes'] ?? []),
    );
  }

}
