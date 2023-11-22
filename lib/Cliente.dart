import 'package:agendar_sillas/widgets/TipoSillas_cliente.dart';
import 'package:flutter/material.dart';

class cliente extends StatelessWidget {
  const cliente({super.key});

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
        drawer: Tipo_sillas_cliente(),
        body: Tipo_sillas_cliente(),
      ),
    );
  }
}

