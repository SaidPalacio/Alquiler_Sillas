import 'package:agendar_sillas/Http/Guardar_categoria.dart';
import 'package:agendar_sillas/Pages/Cliente.dart';
import 'package:agendar_sillas/models/categoria_model.dart';
import 'package:flutter/material.dart';


class categoriawidget extends StatefulWidget {
  const  categoriawidget({super.key});

  @override
  State<categoriawidget> createState() => _categoriawidgetState();
}

class _categoriawidgetState extends State<categoriawidget> {
  final Categoria_Provider _firebaseProvider = Categoria_Provider();
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _imagenesController = TextEditingController();
  bool mensaje=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            /*Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo_silla_2.png'), 
                  fit: BoxFit.cover, 
                ),
              ), 
            ),*/
            Padding(
              padding: EdgeInsets.only(left: 50, top: 80, right: 0),
              child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 40,
                color: Color(0xFF4C53A5),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child:  Column(
                children: [

                  const SizedBox(height: 100,),
                  TextField(
                    controller: _nombre,
                    decoration: const InputDecoration(labelText: 'Nombres'),
                  ),
                  TextField(
                    controller: _imagenesController,
                    decoration: InputDecoration(labelText: 'Imágenes (separadas por coma)'),
                  ),
                  const SizedBox(height: 100,),
                  ElevatedButton(
                    onPressed:(){ 
                      _guardarSilla();
                      if(mensaje==false){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("CATEGORIA AGREGADA"),
                          ),
                        );
                        mensaje=true;
                      }
                      if(mensaje==true){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const cliente() , 
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 8, 222, 205),),
                      fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(color: Colors.black), 
                      ),
                    ),
                    child: const Text(
                      "AGREGAR categoria",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      );
  }
  Future<void> _guardarSilla() async {
    try {
      // Parsear la información de la silla
      String imagenes = _imagenesController.text;
      String nombre = _nombre.text;

      // Crear una instancia de la silla
      categoria nuevacategoria = categoria(
        imagenes: imagenes,
        nombre: nombre,
      );

      // Llamar al método para guardar la silla en Firebase
      await _firebaseProvider.guardarCategoria(nuevacategoria);

      // Mostrar mensaje de éxito
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('categoria Guardada'),
            content: Text('La categoria ha sido guardada exitosamente en Firebase.'),
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
            title: Text('Error al Guardar categoria'),
            content: Text('Hubo un problema al guardar la categoria en Firebase. Por favor, inténtalo de nuevo.'),
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