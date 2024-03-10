
import 'package:flutter/material.dart';

class Usuario extends StatelessWidget {
  const Usuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Tienda'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bienvenido a Mi Tienda'),
                  Icon(Icons.shop), // Coloca aquí tu logotipo
                ],
              ),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Buscar productos'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para buscar productos
              },
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 16),
            const Text('Productos Disponibles'),
            const SizedBox(height: 16),
            // Lista de productos en dos columnas
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: const [
                // Puedes crear elementos de producto aquí
                ProductItem(),
                ProductItem(),
                ProductItem(),
                ProductItem(),
                // Agrega más elementos de producto según sea necesario
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Imagen del producto
          Image.network(
            'URL_DE_LA_IMAGEN_DEL_PRODUCTO',
            fit: BoxFit.cover,
          ),
          // Nombre del producto
          const Text('Nombre del Producto'),
          // Precio del producto
          const Text('Precio: 100.000'),
        ],
      ),
    );
  }
}
