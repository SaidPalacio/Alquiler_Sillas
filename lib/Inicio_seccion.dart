import 'package:agendar_sillas/Cliente.dart';
import 'package:agendar_sillas/amin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Inicio_seccion extends StatefulWidget {
  const Inicio_seccion({super.key});

  @override
  State<Inicio_seccion> createState() => _Inicio_seccionState();
}

class _Inicio_seccionState extends State<Inicio_seccion> {
  final TextEditingController usuario = TextEditingController();
  final TextEditingController pin = TextEditingController();
  final TextEditingController correo = TextEditingController();
  bool esAdministrador = false;

  Future<void> verificar(usuario,pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(usuario == prefs.getString("correo") && pin == prefs.getString("pin")){
        print("inicio de sección satisfactoriamente");
        if(esAdministrador== true){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  AdminPanel(),
            ),
          );
        }else if(esAdministrador==false){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  cliente(),
            ),
          );
        }
    }
    else{
      print("inicio de sección fallido");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuario o contraseña incorrectos"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sección'),
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
            child: Column(
              children: [
                TextField(
                  controller: usuario,
                  decoration: const InputDecoration(labelText: 'Ingrese correo o numero de celular'),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: pin,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Text('¿Es administrador?'),
                    Checkbox(
                      value: esAdministrador,
                      onChanged: (value) {
                        setState(() {
                          esAdministrador = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: (){
                    verificar(usuario.text, pin.text);
                  }, 
                  child: const Text("Acceder")
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}