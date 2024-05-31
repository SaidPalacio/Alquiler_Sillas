class reserva {
  int idsilla;
  int idusuario;
  String nombre;
  String categoria;
  String descripcion;
  double precio;
  String promocion;
  String imagenes;
  int cantidad;

  reserva({
    required this.idusuario,
    required this.idsilla,
    required this.nombre,
    required this.categoria,
    required this.descripcion,
    required this.precio,
    required this.promocion,
    required this.imagenes,
    required this.cantidad,
  });

  Map<String, dynamic> toJson() {
    return {
      'idusuario':idusuario,
      'idsilla':idsilla,
      'nombre': nombre,
      'categoria': categoria,
      'descripcion': descripcion,
      'precio': precio,
      'promocion': promocion,
      'imagenes': imagenes,
      'cantidad':cantidad,
    };
  }
  factory reserva.fromJson(Map<String, dynamic> json) {
    return reserva(
      idsilla: json['idsilla'] ?? 0,
      idusuario: json['idusuario'] ?? 0,
      nombre: json['nombre'] ?? '',
      categoria: json['categoria'] ?? '',
      descripcion: json['descripcion'] ?? '',
      precio: (json['precio'] ?? 0.0).toDouble(),
      promocion: json['promocion'] ?? '',
      imagenes: json['imagenes'] ?? '',
      cantidad: json['cantidad'] ?? 0,
    );
  }

}
