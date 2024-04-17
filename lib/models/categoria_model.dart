class categorias {
  String nombre;
  List<String> imagenes;

  categorias({
    required this.nombre,
    required this.imagenes,
  });

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'imagenes': imagenes,
    };
  }
  factory categorias.fromJson(Map<String, dynamic> json) {
    return categorias(
      nombre: json['nombre'] ?? '',
      imagenes: List<String>.from(json['imagenes'] ?? []),
    );
  }

}
