import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alquiler de Sillas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChairRentalScreen(),
    );
  }
}

class AvailableChairsList extends StatelessWidget {
  final List<Chair> availableChairs;
  final Function(Chair, int) onReserve;

  AvailableChairsList({required this.availableChairs, required this.onReserve});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Sillas Disponibles'),
      ),
      body: ListView.builder(
        itemCount: availableChairs.length,
        itemBuilder: (BuildContext context, int index) {
          final chair = availableChairs[index];
          return ListTile(
            title: Text(chair.name),
            subtitle: Text(
                'Cantidad: ${chair.quantity} - Tipo: ${chair.type}'),
            trailing: ElevatedButton(
              onPressed: () {
                showReservationDialog(context, chair, onReserve);
              },
              child: Text('Reservar'),
            ),
          );
        },
      ),
    );
  }

  void showReservationDialog(BuildContext context, Chair chair,
      Function(Chair, int) onReserve) {
    int quantity = 1; // Cantidad predeterminada

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Reservar ${chair.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Cantidad deseada:'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  quantity = int.tryParse(value) ?? 1;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                onReserve(chair, quantity);
                Navigator.of(context).pop();
              },
              child: Text('Reservar'),
            ),
          ],
        );
      },
    );
  }
}

class Chair {
  final String name;
  int quantity;
  final String type;

  Chair(this.name, this.quantity, this.type);
}

class ChairRentalScreen extends StatefulWidget {
  @override
  _ChairRentalScreenState createState() => _ChairRentalScreenState();
}

class _ChairRentalScreenState extends State<ChairRentalScreen> {
  List<Chair> availableChairs = availableChairsData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alquiler de Sillas')),
      body: AvailableChairsList(
        availableChairs: availableChairs,
        onReserve: makeReservation,
      ),
    );
  }

  void makeReservation(Chair selectedChair, int quantity) {
    final now = DateTime.now();
    final reservation = Reservation(selectedChair, quantity, now);
    reservations.add(reservation);

    final index = availableChairs.indexOf(selectedChair);
    if (index != -1) {
      availableChairs[index].quantity -= quantity;
    }
  }
}

class Reservation {
  final Chair chair;
  final int quantity;
  final DateTime date;

  Reservation(this.chair, this.quantity, this.date);
}

List<Reservation> reservations = [];

List<Chair> availableChairsData = [
  Chair('Silla A', 10, 'Tipo A'),
  Chair('Silla B', 20, 'Tipo B'),
  Chair('Silla C', 15, 'Tipo A'),
  Chair('Silla D', 12, 'Tipo C'),
  // Puedes agregar más sillas aquí.
];
