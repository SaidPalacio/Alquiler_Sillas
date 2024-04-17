import 'package:agendar_sillas/Bienvenida.dart';
import 'package:agendar_sillas/Pages/Cliente.dart';
import 'package:agendar_sillas/Inicio_seccion.dart';
import 'package:agendar_sillas/Pages/amin.dart';
import 'package:agendar_sillas/models/Sillas.dart';
import 'package:agendar_sillas/widgets/DetallesSilla.dart';
import 'package:agendar_sillas/widgets/categoria.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        //useMaterial3: true,
      ),
      home: cliente(),
      /*routes: {
        "/": (context)=>  admin(),
        "itemPage": (context) {
          // Recupera la silla que se pasa como argumento a la ruta
          final Silla_1 silla = ModalRoute.of(context)?.settings.arguments as Silla_1;
          return DetalleSilla(silla: silla); 
        },
      }*/
    );
  }
}

/*class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late bool _isUserLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkUserLoggedIn();
  }
  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
  Future<void> _checkUserLoggedIn() async {
    final isUserLoggedI = await isUserLoggedIn();
    setState(() {
      _isUserLoggedIn = isUserLoggedI;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isUserLoggedIn == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      return _isUserLoggedIn ? const cliente() : const MyHomePage();
    }
  }
}*/
