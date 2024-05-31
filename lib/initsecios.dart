import 'package:flutter/material.dart';
import 'Http/Iniciars.dart';
import 'Pages/Cliente.dart';
import 'Registrarse.dart'; // Ajusta el import según la estructura de tu proyecto

class LoginPage extends StatelessWidget {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final AuthService _authService = AuthService();
  final AuthService_2 _authService_2 = AuthService_2();

  void _login(BuildContext context) async {
    final String correo = _correoController.text;
    final String contrasena = _contrasenaController.text;
    
    final success = await _authService.signIn(correo, contrasena);
    final success_2 = await _authService_2.signIn(correo, contrasena);
    if (success) {
      // Navegar a la página principal o mostrar un mensaje de éxito
      print('Usuario y contraseña correctos en Proveedor');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const cliente(),
        ),
      );
    } else if(success_2){
      // Navegar a la página principal o mostrar un mensaje de éxito
      print('Usuario y contraseña correctos en Cliente');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const cliente(),
        ),
      );
    }else {
      // Mostrar un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo o contraseña incorrectos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              const SizedBox(height: 40),
              SizedBox(
                height: 140,
                width: 200,
              ),
              Text(
                'TAINID ALQUILER',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: Form(
                  child: Column(
                    children: [
                      TextField(
                        controller: _correoController,
                        decoration: const InputDecoration(
                            labelText: 'Ingrese su correo'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _contrasenaController,
                        decoration:
                            const InputDecoration(labelText: 'Contraseña'),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Alinea los elementos al centro horizontalmente
                        children: [
                          Text(
                            "¿No te has registrado?",
                            style: TextStyle(
                              color: Color(0xFF4C53A5),
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registrarse()),
                              );
                            },
                            child: Text(
                              "Registrarse",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                color: Color(0xFF4C53A5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () => _login(context),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          fixedSize:
                              MaterialStateProperty.all(const Size(200, 40)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(color: Colors.white),
                          ),
                        ),
                        child: const Text(
                          "Acceder",
                          style:
                              TextStyle(color: Color(0xFF4C53A5), fontSize: 20),
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
