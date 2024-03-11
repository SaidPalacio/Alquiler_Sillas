import 'package:agendar_sillas/Providers/guardar_sillas.dart';
import 'package:agendar_sillas/amin.dart';
import 'package:agendar_sillas/models/Sillas.dart';
import 'package:flutter/material.dart';


class agregarsilla extends StatefulWidget {
  const  agregarsilla({super.key});

  @override
  State<agregarsilla> createState() => _agregarsillaState();
}

class _agregarsillaState extends State<agregarsilla> {
  final FirebaseProvider_3 _firebaseProvider = FirebaseProvider_3();
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _categoria = TextEditingController();
  final TextEditingController _precio = TextEditingController();
  final TextEditingController _descripcion= TextEditingController();
  final TextEditingController _promocion = TextEditingController();
  final TextEditingController _imagenesController = TextEditingController();
  bool mensaje=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo_silla_2.png'), 
                  fit: BoxFit.cover, 
                ),
              ), 
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child:  Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const admin() , 
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 8, 222, 205),),
                        fixedSize: MaterialStateProperty.all(const Size(135, 30)),
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
                        "← ATRAS",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100,),
                  TextField(
                    controller: _nombre,
                    decoration: const InputDecoration(labelText: 'Nombres'),
                  ),
                  TextField(
                    controller: _categoria,
                    decoration: const InputDecoration(labelText: 'Categoria'),
                  ),
                  TextField(
                    controller: _precio,
                    decoration: const InputDecoration(labelText: 'Precio'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: _descripcion,
                    decoration: const InputDecoration(labelText: 'Descripción'),
                    keyboardType: TextInputType.phone,
                  ),
                  TextField(
                    controller: _promocion,
                    decoration: const InputDecoration(labelText: 'Promoción'),
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
                            content: Text("SILLA AGREGADA"),
                          ),
                        );
                        mensaje=true;
                      }
                      if(mensaje==true){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const admin() , 
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
                      "AGREGAR SILLA",
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
      String nombre = _nombre.text;
      String categoria = _categoria.text;
      double precio = double.parse(_precio.text);
      String descripcion = _descripcion.text;
      String promocion = _promocion.text;
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