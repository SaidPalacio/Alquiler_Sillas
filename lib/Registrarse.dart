import 'dart:math';
import 'package:agendar_sillas/Inicio_seccion.dart';
import 'package:agendar_sillas/Http/usuario.dart';
import 'package:agendar_sillas/models/Usuarios.dart';
import 'package:flutter/material.dart';


class Registrarse extends StatefulWidget {
  const Registrarse({super.key});
  
  
  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  final usuarioProvider = FirebaseProvider(); // Usa FirebaseProvider
  final formKey = GlobalKey<FormState>();
  late TextEditingController nombre = TextEditingController();
  late TextEditingController apellido = TextEditingController();
  late TextEditingController correo = TextEditingController();
  late TextEditingController celular= TextEditingController();
  late TextEditingController direccion = TextEditingController();
  late TextEditingController pin = TextEditingController();
  late TextEditingController confipin = TextEditingController();
  List<String> carrito =[""];
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
              child:  Form(
                key: formKey,
                child: Column( 
                  children:[
                    Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton(
                        onPressed:(){
                          Navigator.pop(context);
                      
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 8, 222, 205),),
                          fixedSize: MaterialStateProperty.all(const Size(135, 40)),
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
                  const SizedBox(height: 100,),
                  ElevatedButton(
                    onPressed:(){ 
                      if(pin.text == confipin.text){
                        _submit();
                        print("guardado correctamente");
                       
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Inicio_seccion(), 
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
                      "REGISTRARSE",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                      ),
                    ),
                  )
                ],
              )
              ),
            ),
          ],
        )
      );
  }
  void _submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Random random = Random();
      int idUsuario = random.nextInt(1000000)+1;
      UsuarioModel usuario = UsuarioModel(
        contrasena: pin.text,
        correo: correo.text,
        direccion: direccion.text,
        idUsuario: idUsuario,
        nombre: nombre.text,
        telefono: celular.text,
        apellido: apellido.text,
      );

      usuarioProvider.createUsuario(usuario);
    }
  }
}

