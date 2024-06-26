import 'package:agendar_sillas/Providers/Usuarios_provider.dart';
import 'package:agendar_sillas/Providers/proveedores_provider.dart';
import 'package:agendar_sillas/Registrarse.dart';
import 'package:agendar_sillas/models/Usuarios.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  //AuthenticationService authService = AuthenticationService();
  //3AuthenticationService_2 authService_2 = AuthenticationService_2();
  bool esAdministrador = false;

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

  String obtenerNombreUsuarioPorCorreo(
      String correo, List<UsuarioModel> listaUsuarios) {
    String nombreUsuario = "";
    for (UsuarioModel usuario in listaUsuarios) {
      if (usuario.correo == correo) {
        nombreUsuario = usuario.nombre;
        break; // Salir del bucle una vez que se encuentra el usuario
      }
    }
    return nombreUsuario;
  }

  int obteneridusuarioporcorreo(
      String correo, List<UsuarioModel> listaUsuarios) {
    int idusuario = 0;
    for (UsuarioModel usuario in listaUsuarios) {
      if (usuario.correo == correo) {
        idusuario = usuario.idUsuario;
        break; // Salir del bucle una vez que se encuentra el usuario
      }
    }
    return idusuario;
  }

  /*Future<void> borrardatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('pin');
    prefs.remove('correo');
    prefs.remove('isLoggedIn');
    
    //prefs.clear();
  }*/

  /*void checkUserLoggedIn() async {
    final isLoggedIn = await isUserLoggedIn();
    if (isLoggedIn) {
      // Si el usuario ya está autenticado, navegar a la página correspondiente
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => cliente()));
    }
  }*/
  
  @override
  Widget build(BuildContext context) {
    final usuariosProvider = Provider.of<UsuariosProvider>(context);
    final usuarios = usuariosProvider.usuarios;
    final proveedoresProvider = Provider.of<ProveedoresProvider>(context);
    final proveedores = proveedoresProvider.proveedores;

    return Scaffold(
      body: Stack(
        children: [
          /*Image.asset(
            'fondo_silla_2.png', 
            fit: BoxFit.cover,
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
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              const SizedBox(height: 40),
              SizedBox(
                height: 140,
                width: 200,
                /*child: ClipOval(
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
                ),*/
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
                        onPressed: () async {
                          String nombreusuario = "";
                          int idusuario = 0;
                          nombreusuario = obtenerNombreUsuarioPorCorreo(
                              usuario.text, usuarios);
                          if (nombreusuario == "") {
                            nombreusuario = obtenerNombreUsuarioPorCorreo(
                                usuario.text, proveedores);
                          }
                          idusuario =
                              obteneridusuarioporcorreo(usuario.text, usuarios);
                          if (idusuario == 0) {
                            idusuario = obteneridusuarioporcorreo(
                                usuario.text, proveedores);
                          }
                          print("hola");
                          //List<String?> valores = await usuario_pin();
                         // bool isLoggedIn = await authService.signIn(
                              //usuario.text, pin.text, nombreusuario, idusuario);
                          //bool isLoggedIn_2 = await authService_2.signIn_2(
                              //usuario.text, pin.text);
                          
                        },
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
