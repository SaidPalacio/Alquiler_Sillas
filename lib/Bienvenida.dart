import 'package:agendar_sillas/Inicio_seccion.dart';
import 'package:agendar_sillas/Registrarse.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Para que la imagen de fondo cubra toda la pantalla
        children: [
          // Fondo de pantalla
          Image.asset(
            'fondo_silla_2.png', // Reemplaza con la ruta de tu imagen de fondo
            fit: BoxFit.cover,
          ),
          // Contenido en el centro
          Column(
            children: [
              Container(
                height: 300,
                width: 300,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/logo_silla.png',
                  image: 'assets/logo_silla.png',
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BIENVENIDO A NOMBRE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 222, 205),
                  height: -10
                ),
              ),
              
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  onPressed: () {
                    
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  const Inicio_seccion()),//AnimatedMarkersMap
                  );

                    print("INIAR SESIÓN");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 8, 222, 205)),
                  ),
                  child: const Text(
                    'INICIAR SESIÓN',
                    style: TextStyle(
                      color: Colors.black, // Color de texto personalizado
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50), 
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  const Registrarse()),//AnimatedMarkersMap
                    );
                    
                    print('REGISTRARSE');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 8, 222, 205)),
                  ),
                  child: const Text(
                    'REGISTRARSE',
                    style: TextStyle(
                      color: Colors.black, // Color de texto personalizado
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

