import 'package:agendar_sillas/models/Sillas.dart';
import 'package:agendar_sillas/models/reserva_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Http/guardar_reserva.dart';
import '../Providers/reserva_provider.dart';

class ItemBottomNavBar extends StatefulWidget {
  final int cantidad;
  final double precio;
  final int cantdias;
  final Silla_1 silla;

  const ItemBottomNavBar(
      {Key? key,
      required this.cantidad,
      required this.precio,
      required this.cantdias,
      required this.silla})
      : super(key: key);

  @override
  State<ItemBottomNavBar> createState() => _ItemBottomNavBarState();
}

double calcularPrecioTotal(
    int cantidad, double precioUnitario, int cantidadDias) {
  double precio = 0;
  double preciodias = 0;
  double precioporsilla = (cantidad * precioUnitario);

  if (cantidadDias <= 5) {
    preciodias = precioporsilla * 0.2;
  } else if (cantidadDias <= 10) {
    preciodias = precioporsilla * 0.4;
  } else {
    preciodias = precioporsilla * 0.6;
  }
  if (cantidadDias == 0) {
    precio = precioporsilla;
  } else {
    precio = precioporsilla + preciodias;
  }

  return precio;
}

class _ItemBottomNavBarState extends State<ItemBottomNavBar> {
  final reserva_provi _firebaseProvider = reserva_provi();

  Future<int> obtenerid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("cliente_id") ??
        0; // Devuelve el valor asociado a la clave, o una cadena vacía si no se encuentra ningún valor
  }

  Future<bool> acceso() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("cliente") ??  false; // Devuelve el valor asociado a la clave, o una cadena vacía si no se encuentra ningún valor
  }

  //final agregarcarrito = Guardarcarrito();
  @override
  Widget build(BuildContext context) {
    double precioTotal =
      calcularPrecioTotal(widget.cantidad, widget.precio, widget.cantdias);
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${precioTotal.toString()}', // precio
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5)),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                bool  ingreso = await acceso();
                if(ingreso==true){
                  if (widget.cantdias > 0) {
                    _guardarSilla(precioTotal);
                    Provider.of<ReservaProvider >(context,listen:false).fetchreservas();
                    Navigator.pop(context);
                    Provider.of<ReservaProvider >(context,listen:false).fetchreservas();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("INGRESE EL RANGO DE DIAS"),
                      ),
                    );
                  }
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("INICIE SECIÓN PARA PODER AGREGAR AL CARRITO"),
                      ),
                    );
                }
              },
              icon: Icon(CupertinoIcons.cart_fill_badge_plus),
              label: Text(
                "Añadir al carrito",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF4C53A5)),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Future<void> _guardarSilla(double precio) async {
    try {
      // Crear una instancia de la silla
      int idusuario = await obtenerid();
      reserva nuevareserva = reserva(
        idusuario: idusuario,
        idsilla: widget.silla.id,
        nombre: widget.silla.nombre,
        categoria: widget.silla.categoria,
        descripcion: widget.silla.descripcion,
        precio: precio,
        promocion: widget.silla.promocion,
        imagenes: widget.silla.imagenes,
        cantidad: widget.cantidad,
      );
      //String correo =obtenercorreo().toString();
      // Llamar al método para guardar la silla en Firebase
      await _firebaseProvider.guadar_reserva(nuevareserva);

      // Mostrar mensaje de éxito
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Silla Guardada'),
            content:
                Text('La silla ha sido guardada exitosamente en el carrito.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Mostrar mensaje de error si ocurre algún problema
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error al Guardar Silla'),
            content: Text(
                'Hubo un problema al guardar la silla en Firebase. Por favor, inténtalo de nuevo.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
