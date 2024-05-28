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
  String descripcion;
  int id;
  double precio;
  String promocion;
  String imagenes;
  int cantidad;

  Silla_1({
    required this.nombre,
    required this.categoria,
    required this.descripcion,
    required this.id,
    required this.precio,
    required this.promocion,
    required this.imagenes,
    required this.cantidad,
  });

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'categoria': categoria,
      'descripcion': descripcion,
      'id': id,
      'precio': precio,
      'promocion': promocion,
      'imagenes': imagenes,
      'cantidad':cantidad,
    };
  }
  factory Silla_1.fromJson(Map<String, dynamic> json) {
    return Silla_1(
      nombre: json['nombre'] ?? '',
      categoria: json['categoria'] ?? '',
      descripcion: json['descripcion'] ?? '',
      id: json['id'] ?? 0,
      precio: (json['precio'] ?? 0.0).toDouble(),
      promocion: json['promocion'] ?? '',
      imagenes: json['imagenes'] ?? '',
      cantidad: json['cantidad'] ?? 0,
    );
  }

}
