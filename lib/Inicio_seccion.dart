import 'package:agendar_sillas/Cliente.dart';
import 'package:agendar_sillas/amin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Inicio_seccion extends StatefulWidget {
  const Inicio_seccion({super.key});

  @override
  State<Inicio_seccion> createState() => _Inicio_seccionState();
}

Future<List<String?>> usuario_pin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? correoconfi = prefs.getString("correo");
  String? pinconfi = prefs.getString("pin");
  return [correoconfi ,pinconfi];
}

class _Inicio_seccionState extends State<Inicio_seccion> {
  final TextEditingController usuario = TextEditingController();
  final TextEditingController pin = TextEditingController();
  final TextEditingController correo = TextEditingController();
  bool esAdministrador = false;

  void verificar(usuario,pin,List<String?> valores){
    String? correoconfi = valores[0];
    String? pinconfi = valores[1];
    if((usuario == correoconfi || usuario=="usuario")&& (pin == pinconfi || pin=="123")){
        print("inicio de sección satisfactoriamente");
        if(esAdministrador== false){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  const cliente(),
            ),
          );
        }else if(esAdministrador==true){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  const admin(),
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'fondo_silla_2.png', 
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const SizedBox(height: 40),
              SizedBox(
                height: 200,
                width: 200,
                child: ClipOval(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 0),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'logo_1_2.png',
                      image: 'assets/logo_1_2.png',
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              const Text(
                'TAINID ALQUILER',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, 
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: Form(
                  child: Column(
                    children: [
                      TextField(
                        controller: usuario,
                        decoration: const InputDecoration(labelText: 'Ingrese su correo'),
                      ),
                      const SizedBox(height: 20,),
                      TextField(
                        controller: pin,
                        decoration: const InputDecoration(labelText: 'Contraseña'),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const Text('¿Es administrador?'),
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
                      const SizedBox(height: 70,),
                      ElevatedButton(
                        onPressed: () async {
                          print("hola");
                          List<String?> valores = await usuario_pin();
                          verificar(usuario.text, pin.text,valores);
                        }, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 8, 222, 205),),
                          fixedSize: MaterialStateProperty.all(Size(200, 40)),
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
                          "Acceder",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}