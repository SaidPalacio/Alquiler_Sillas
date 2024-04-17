import 'package:agendar_sillas/Pages/carrito_pagina.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar_2 extends StatelessWidget {
  const HomeAppBar_2({super.key});

//  PARTE SUPERIOR

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.10, 
            width: MediaQuery.of(context).size.width * 0.06, 
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                size: MediaQuery.of(context).size.width * 0.07,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
          const SizedBox(width: 25),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.3, 
              child: Text(
                "TAINID",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ),
          ),
          /*const Spacer(),
          badges.Badge(
            badgeContent:  Text(
              '3',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              child:  Icon(
                Icons.shopping_bag_outlined,
                size: MediaQuery.of(context).size.width *0.08,
                color: Color(0xFF4C53A5),
              )
            )
          ),*/
        ],
      ),
    );
  }
}

