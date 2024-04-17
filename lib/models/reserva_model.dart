class reserva {
  String nombre;
  String categoria;
  double precio;
  String descripcion;
  String promocion;
  int cantidad;
  int idsilla;
  int idusuario;
  List<String> imagenes;

  reserva({
    required this.nombre,
    required this.categoria,
    required this.precio,
    required this.descripcion,
    required this.promocion,
    required this.cantidad,
    required this.idsilla,
    required this.idusuario,
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
      'idsilla':idsilla,
      'idusuario':idusuario,
      'imagenes': imagenes,
    };
  }
  factory reserva.fromJson(Map<String, dynamic> json) {
    return reserva(
      nombre: json['nombre'] ?? '',
      categoria: json['categoria'] ?? '',
      precio: (json['precio'] ?? 0.0).toDouble(),
      descripcion: json['descripcion'] ?? '',
      promocion: json['promocion'] ?? '',
      cantidad: json['cantidad'] ?? 0,
      idsilla: json['idsilla'] ?? 0,
      idusuario: json['idusuario'] ?? 0,
      imagenes: List<String>.from(json['imagenes'] ?? []),
    );
  }

}
