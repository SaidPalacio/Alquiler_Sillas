import 'package:agendar_sillas/Inicio_seccion.dart';
import 'package:agendar_sillas/Registrarse.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  Future<void> imprimirClaves() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Set<String> claves = prefs.getKeys();

  
  print("Claves en SharedPreferences: $claves");
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
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
              const SizedBox(height: 0),
              const Text(
                'TAINID ALQUILER',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, 
                ),
              ), 
              const SizedBox(height: 80),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>  const Inicio_seccion()),
                    );
                    print("INIAR SESIÓN");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 8, 222, 205)),
                    fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                  ),
                  child: const Text(
                    'INICIAR SESIÓN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), 
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Registrarse()),
                    );
                    print('REGISTRARSE');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 8, 222, 205)),
                    fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                  ),
                  child: const Text(
                    'REGISTRARSE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20 
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 340), 
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    /*Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  const Registrarse()),//AnimatedMarkersMap
                    );*/
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(null),
                    fixedSize: MaterialStateProperty.all(const Size(300, 40)),
                  ),
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    ),
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

