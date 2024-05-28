import 'package:agendar_sillas/widgets/DetallesSilla.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/sillas_provider.dart';
import '../widgets/HomeAppBar_2.dart';

class Eliminar_Silla extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final sillasProvider = Provider.of<SillasProvider>(context);
    final sillas = sillasProvider.sillas;
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar_2(),
          Container(
            // Temporal
            //height: 500,
            padding: EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                GridView.count(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.width > 600 ? 4.7: 2.23) /
                      300,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 600 ? 4 : 2,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: sillas.map((silla) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color(0xFF4C53A5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "-50%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  
                                },
                                icon: Icon(Icons.delete,
                                color: Colors.red,)
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetalleSilla(silla: silla)),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              child: Image.asset(
                                silla.imagenes,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            silla.nombre,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF4C53A5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            silla.descripcion,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4C53A5),
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${silla.precio}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                              Icon(
                                Icons.shopping_cart_checkout,
                                color: Color(0xFF4C53A5),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
