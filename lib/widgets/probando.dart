import 'package:agendar_sillas/Providers/guardar_sillas.dart';
import 'package:agendar_sillas/models/Sillas.dart';
import 'package:flutter/material.dart';// Asegúrate de importar tu proveedor de Firebase

class AgregarSillaScreen extends StatefulWidget {
  @override
  _AgregarSillaScreenState createState() => _AgregarSillaScreenState();
}

class _AgregarSillaScreenState extends State<AgregarSillaScreen> {
  final FirebaseProvider_3 _firebaseProvider = FirebaseProvider_3(); // Instancia del proveedor de Firebase

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _calificacionController = TextEditingController();
  final TextEditingController _promocionController = TextEditingController();
  final TextEditingController _imagenesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Silla'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _categoriaController,
              decoration: InputDecoration(labelText: 'Categoría'),
            ),
            TextField(
              controller: _precioController,
              decoration: InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
              maxLines: 3,
            ),
            TextField(
              controller: _calificacionController,
              decoration: InputDecoration(labelText: 'Calificación'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _promocionController,
              decoration: InputDecoration(labelText: 'Promoción'),
            ),
            TextField(
              controller: _imagenesController,
              decoration: InputDecoration(labelText: 'Imágenes (separadas por coma)'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _guardarSilla();
              },
              child: Text('Guardar Silla'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _guardarSilla() async {
    try {
      // Parsear la información de la silla
      String nombre = _nombreController.text;
      String categoria = _categoriaController.text;
      double precio = double.parse(_precioController.text);
      String descripcion = _descripcionController.text;
      String promocion = _promocionController.text;
      List<String> imagenes = _imagenesController.text.split(',');

      // Crear una instancia de la silla
      Silla_1 nuevaSilla = Silla_1(
        nombre: nombre,
        categoria: categoria,
        precio: precio,
        descripcion: descripcion,
        promocion: promocion,
        imagenes: imagenes,
      );

      // Llamar al método para guardar la silla en Firebase
      await _firebaseProvider.guardarSilla(nuevaSilla);

      // Mostrar mensaje de éxito
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Silla Guardada'),
            content: Text('La silla ha sido guardada exitosamente en Firebase.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Mostrar mensaje de error si ocurre algún problema
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error al Guardar Silla'),
            content: Text('Hubo un problema al guardar la silla en Firebase. Por favor, inténtalo de nuevo.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}