import 'package:agendar_sillas/Cliente.dart';
import 'package:agendar_sillas/models/Sillas.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetalleSilla extends StatelessWidget {
  final Silla_1 silla;

  const DetalleSilla({Key? key, required this.silla}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(silla.nombre),
      ),
      body: Column(
        children: [
          Hero(
            tag: "imagen-${silla.nombre}",
            child: SizedBox(
              height: 300,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  enlargeCenterPage: true,
                ),
                items:silla.imagenes.map((url){
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "nombre:${silla.nombre}",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "Descipción:${silla.descripcion}",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "precio:${silla.precio}",
                  style: const TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                  onPressed:(){
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Alquiler reservado"),
                    ),
                  );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>  const cliente(),
                    ),
                  );
                  
                  }, 
                  child: const Text("Alquilar"))
              ],
            ),
          )
        ],
      ),
    );
  }
}