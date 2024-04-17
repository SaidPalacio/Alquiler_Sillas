class Silla {
  final String nombre;
  final String categoria;
  final double precio;
  List<String> imagenUrl;
  final String descripcion;
  final String calificacion;
  final String promocion;

  Silla({
    required this.nombre,
    required this.categoria,
    required this.precio,
    required this.imagenUrl,
    required this.descripcion,
    required this.calificacion,
    required this.promocion,
  });

  
}



class Silla_1 {
  String nombre;
  String categoria;
  double precio;
  String descripcion;
  String promocion;
  int cantidad;
  int id;
  List<String> imagenes;

  Silla_1({
    required this.nombre,
    required this.categoria,
    required this.precio,
    required this.descripcion,
    required this.promocion,
    required this.cantidad,
    required this.id,
    required this.imagenes,
  });

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'categoria': categoria,
      'precio': precio,
      'descripcion': descripcion,
      'promocion': promocion,
      'cantidad':cantidad,
      'id':id,
      'imagenes': imagenes,
    };
  }
  factory Silla_1.fromJson(Map<String, dynamic> json) {
    return Silla_1(
      nombre: json['nombre'] ?? '',
      categoria: json['categoria'] ?? '',
      precio: (json['precio'] ?? 0.0).toDouble(),
      descripcion: json['descripcion'] ?? '',
      promocion: json['promocion'] ?? '',
      cantidad: json['cantidad'] ?? 0,
      id: json['cantidad'] ?? 0,
      imagenes: List<String>.from(json['imagenes'] ?? []),
    );
  }

}
