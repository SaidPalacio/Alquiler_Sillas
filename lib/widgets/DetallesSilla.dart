import 'package:agendar_sillas/models/Sillas.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'ItemAppBar.dart';
import 'ItemBottomNavBar.dart';

class DetalleSilla extends StatefulWidget {
  final Silla_1 silla;

  DetalleSilla({Key? key, required this.silla}) : super(key: key);

  @override
  State<DetalleSilla> createState() => _DetalleSillaState();
}

class _DetalleSillaState extends State<DetalleSilla> {
  final TextEditingController _dateRangeController = TextEditingController();
  int cant = 1;
  int cantdias = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset(
              widget.silla.imagenes,
              height: 300,
            ),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 48,
                        bottom: 15,
                      ),
                      child: Row(
                        children: [
                          Text(
                            widget.silla.nombre,
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF4C53A5),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Color(0xFF4C53A5),
                            ),
                            onRatingUpdate: (index) {},
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                    color: Color(0xFF4C53A5),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (cant > 1) {
                                        cant--;
                                      }
                                    });
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  cant.toString(),
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4C53A5),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.plus,
                                    size: 18,
                                    color: Color(0xFF4C53A5),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      cant ++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        widget.silla.descripcion,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            color: Color(0xFF4C53A5),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              readOnly: true,
                              controller: _dateRangeController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Rango de fecha:",
                              ),
                              onTap: () async {
                                final DateTimeRange? pickedDateRange =
                                    await showDateRangePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2101),
                                );
                                if (pickedDateRange != null) {
                                  _dateRangeController.text =
                                      "${DateFormat("yyyy-MM-dd").format(pickedDateRange.start)} - ${DateFormat("yyyy-MM-dd").format(pickedDateRange.end)}";
                                      setState(() {
                                       cantdias = pickedDateRange.end.difference(pickedDateRange.start).inDays;
                                    });
                                }
                                
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ItemBottomNavBar(
        cantidad: cant,
        precio:  widget.silla.precio,
        cantdias: cantdias,
        silla: widget.silla,
      ),
    );
  }
}
/*
class DetalleSilla_2 extends StatelessWidget {
  final Silla_1 silla;

  const DetalleSilla_2({Key? key, required this.silla}) : super(key: key);

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
                items: silla.imagenes.map((url) {
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Alquiler reservado"),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const cliente(),
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
*/