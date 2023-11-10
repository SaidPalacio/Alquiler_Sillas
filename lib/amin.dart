import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panel de Administración'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Gestión de Inventario'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InventoryManagement(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Solicitudes de Alquiler'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RentalRequests(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class InventoryManagement extends StatefulWidget {
  @override
  _InventoryManagementState createState() => _InventoryManagementState();
}

class _InventoryManagementState extends State<InventoryManagement> {
  List<Chair> inventory = [
    Chair('Silla A', 10),
    Chair('Silla B', 20),
    Chair('Silla C', 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Inventario'),
      ),
      body: ListView.builder(
        itemCount: inventory.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(inventory[index].name),
            subtitle: Text('Cantidad disponible: ${inventory[index].quantity}'),
          );
        },
      ),
    );
  }
}

class RentalRequests extends StatefulWidget {
  @override
  _RentalRequestsState createState() => _RentalRequestsState();
}

class _RentalRequestsState extends State<RentalRequests> {
  List<RentalRequest> requests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitudes de Alquiler'),
      ),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Cliente: ${requests[index].clientName}'),
            subtitle: Text('Silla: ${requests[index].chairName} - Cantidad: ${requests[index].quantity}'),
          );
        },
      ),
    );
  }
}

class Chair {
  final String name;
  int quantity;

  Chair(this.name, this.quantity);
}

class RentalRequest {
  final String clientName;
  final String chairName;
  final int quantity;

  RentalRequest(this.clientName, this.chairName, this.quantity);
}
