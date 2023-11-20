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