import 'package:agendar_sillas/models/Sillas.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetalleSilla extends StatelessWidget {
  final Silla silla;

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
            child: Container(
              height: 300,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  enlargeCenterPage: true,
                ),
                items:silla.imagenUrl.map((url){
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
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "precio:${silla.precio}",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}