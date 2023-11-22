import 'package:agendar_sillas/widgets/TipoSillas_admin.dart';
import 'package:flutter/material.dart';

class admin extends StatelessWidget {
  const admin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Tienda de Sillas'),
          centerTitle: true,
          
        ),
        body: Tipo_sillas_admin(),
      ),
    );
  }
}