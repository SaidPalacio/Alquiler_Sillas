import 'package:agendar_sillas/Inicio_seccion.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Registrarse extends StatefulWidget {
  const Registrarse({super.key});

  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  final TextEditingController nombre = TextEditingController();
  final TextEditingController apellido = TextEditingController();
  final TextEditingController correo = TextEditingController();
  final TextEditingController celular= TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController pin = TextEditingController();
  final TextEditingController confipin = TextEditingController();
  _guardar(nombre,apellido,correo,celular,direccion,pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("nombre",nombre);
    prefs.setString("apellido",apellido);
    prefs.setString("correo",correo);
    prefs.setString("celular",celular);
    prefs.setString("direccion",direccion);
    prefs.setString("pin",pin);
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 8, 222, 205),
      ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo_silla_2.png'), // Reemplaza con la ubicación de tu imagen de fondo
                  fit: BoxFit.cover, // Ajusta la imagen al tamaño de la pantalla
                ),
              ),    
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child:  Column(
                children: [
                  TextField(
                    controller: nombre,
                    decoration: const InputDecoration(labelText: 'Nombres'),
                  ),
                  TextField(
                    controller: apellido,
                    decoration: const InputDecoration(labelText: 'Apellidos'),
                  ),
                  TextField(
                    controller: correo,
                    decoration: const InputDecoration(labelText: 'Correo Electrónico'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: celular,
                    decoration: const InputDecoration(labelText: 'Número de Teléfono'),
                    keyboardType: TextInputType.phone,
                  ),
                  TextField(
                    controller: direccion,
                    decoration: const InputDecoration(labelText: 'Dirección'),
                  ),
                  TextField(
                    controller: pin,
                    decoration:const InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                  ),
                  TextField(
                    controller: confipin,
                    decoration:const InputDecoration(labelText: 'Confirmar Contraseña'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed:(){ 
                      if(pin.text == confipin.text){
                       _guardar(nombre.text,apellido.text,correo.text,celular.text,direccion.text,pin.text);  
                       print("se guardo en shared");
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Inicio_seccion(), // Reemplaza con la página de destino
                          ),
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("La contraseña no coincide"),
                          ),

                        );
                      }
                    },
                    child: const Text("Registrase"),
                  )
                ],
              ),
            ),
          ],
        )
      );
  }
}

