import 'package:agendar_sillas/Pages/Cliente.dart';
import 'package:agendar_sillas/Providers/Iniciars.dart';
import 'package:agendar_sillas/Providers/leer_proveedores.dart';
import 'package:agendar_sillas/Registrarse.dart';
import 'package:agendar_sillas/models/Usuarios.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Providers/leer_usuarios_clientes.dart';


class Inicio_seccion extends StatefulWidget {
  const Inicio_seccion({super.key});

  @override
  State<Inicio_seccion> createState() => _Inicio_seccionState();
}

Future<List<String?>> usuario_pin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? correoconfi = prefs.getString("correo");
  String? pinconfi = prefs.getString("pin");
  return [correoconfi, pinconfi];
}

Future<bool> isUserLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

class _Inicio_seccionState extends State<Inicio_seccion> {
  final TextEditingController usuario = TextEditingController();
  final TextEditingController pin = TextEditingController();
  final TextEditingController correo = TextEditingController();
  AuthenticationService authService = AuthenticationService();
  AuthenticationService_2 authService_2 = AuthenticationService_2();
  bool esAdministrador = false;
  leerusuarios leeusuarios = leerusuarios();
  List<UsuarioModel> usuariosList = [];
  leerproveedores leerprovee = leerproveedores();
  List<UsuarioModel> proveeList = [];

  /* void verificar(usuario,pin,List<String?> valores){
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
 */

  @override
  void initState() {
    super.initState();
    cargarDatosusuarios();
    cargarDatosprovee();
    //checkUserLoggedIn();
    //borrardatos();
    //recuperardatos();
  }

  Future<void> recuperardatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();

    for (String key in keys) {
      print('$key: ${prefs.get(key)}');
    }
  }
  Future<void> cargarDatosusuarios() async {
    try {
      // Cargar usuarios desde Firebase
      List<UsuarioModel> usuariosDesdeFirebase = await leeusuarios.fetchUsuario();
      setState(() {
        usuariosList = usuariosDesdeFirebase;
      });

    } catch (e) {
      print('Error al cargar los datos: $e');
    }
  }
  Future<void> cargarDatosprovee() async {
    try {
      // Cargar usuarios desde Firebase
      List<UsuarioModel> proveeDesdeFirebase = await leerprovee.fetchprovee();
      setState(() {
        proveeList = proveeDesdeFirebase;
      });

    } catch (e) {
      print('Error al cargar los datos: $e');
    }
  }

  String obtenerNombreUsuarioPorCorreo(String correo, List<UsuarioModel> listaUsuarios) {
  String nombreUsuario = "";
  for (UsuarioModel usuario in listaUsuarios) {
    if (usuario.correo == correo) {
      nombreUsuario = usuario.nombre;
      break; // Salir del bucle una vez que se encuentra el usuario
    }
  }
  return nombreUsuario;
  }
  String obtenerNombreUsuarioPorCorreo_2(String correo, List<UsuarioModel> listaUsuarios) {
  String nombreUsuario = "";
  for (UsuarioModel usuario in listaUsuarios) {
    if (usuario.correo == correo) {
      nombreUsuario = usuario.nombre;
      break; // Salir del bucle una vez que se encuentra el usuario
    }
  }
  return nombreUsuario;
  }

  Future<void> borrardatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('pin');
    prefs.remove('correo');
    prefs.remove('isLoggedIn');
    
    //prefs.clear();
  }

  void checkUserLoggedIn() async {
    final isLoggedIn = await isUserLoggedIn();
    if (isLoggedIn) {
      // Si el usuario ya está autenticado, navegar a la página correspondiente
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => cliente()));
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
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const cliente(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 8, 222, 205),
                    ),
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
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
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
              Text(
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
                        decoration: const InputDecoration(
                            labelText: 'Ingrese su correo'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: pin,
                        decoration:
                            const InputDecoration(labelText: 'Contraseña'),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Registrarse()),
                          );
                        }, 
                        child: Text(
                          "Registrarse",
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.04, 
                          color: Colors.black,
                          ),
                        )
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          String nombreusuario= "";
                          nombreusuario= obtenerNombreUsuarioPorCorreo(usuario.text, usuariosList);
                          if(nombreusuario == ""){
                            nombreusuario = obtenerNombreUsuarioPorCorreo_2(usuario.text, proveeList);

                          }
                          print("hola");
                          //List<String?> valores = await usuario_pin();
                          bool isLoggedIn =
                              await authService.signIn(usuario.text, pin.text,nombreusuario);
                          bool isLoggedIn_2 = await authService_2.signIn_2(usuario.text, pin.text, nombreusuario);
                          if (isLoggedIn == true) {
                            print('Usuario y contraseña correctos en cliente');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const cliente(),
                              ),
                            );
                          } else if (isLoggedIn_2 == true) {
                            print(
                                'Usuario y contraseña correctos en proveedor');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const cliente(),
                              ),
                            );
                          } else {
                            print('Usuario o contraseña incorrectos');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Usuario o contraseña incorrectos"),
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 8, 222, 205),
                          ),
                          fixedSize:
                              MaterialStateProperty.all(const Size(200, 40)),
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
                          style: TextStyle(color: Colors.black, fontSize: 20),
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
