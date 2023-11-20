import 'package:agendar_sillas/widgets/TipoSillas.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        body: Tipo_sillas(),
      ),
    );
  }
}

