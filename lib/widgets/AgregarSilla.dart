import 'package:agendar_sillas/amin.dart';
import 'package:flutter/material.dart';


class agregarsilla extends StatefulWidget {
  const  agregarsilla({super.key});

  @override
  State<agregarsilla> createState() => _agregarsillaState();
}

class _agregarsillaState extends State<agregarsilla> {
  final TextEditingController nombre = TextEditingController();
  final TextEditingController categoria = TextEditingController();
  final TextEditingController precio = TextEditingController();
  final TextEditingController descripcion= TextEditingController();
  final TextEditingController promocion = TextEditingController();
  bool mensaje=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo_silla_2.png'), 
                  fit: BoxFit.cover, 
                ),
              ), 
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child:  Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const admin() , 
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 8, 222, 205),),
                        fixedSize: MaterialStateProperty.all(Size(135, 30)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(color: Colors.black), 
                        ),
                      ),
                      child: const Text(
                        "← ATRAS",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100,),
                  TextField(
                    controller: nombre,
                    decoration: const InputDecoration(labelText: 'Nombres'),
                  ),
                  TextField(
                    controller: categoria,
                    decoration: const InputDecoration(labelText: 'Categoria'),
                  ),
                  TextField(
                    controller: precio,
                    decoration: const InputDecoration(labelText: 'Precio'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: descripcion,
                    decoration: const InputDecoration(labelText: 'Descripción'),
                    keyboardType: TextInputType.phone,
                  ),
                  TextField(
                    controller: promocion,
                    decoration: const InputDecoration(labelText: 'Promoción'),
                  ),
                  const SizedBox(height: 100,),
                  ElevatedButton(
                    onPressed:(){ 
                      if(mensaje==false){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("SILLA AGREGADA"),
                          ),
                        );
                        mensaje=true;
                      }
                      if(mensaje==true){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const admin() , 
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 8, 222, 205),),
                      fixedSize: MaterialStateProperty.all(Size(200, 40)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(color: Colors.black), 
                      ),
                    ),
                    child: const Text(
                      "AGREGAR SILLA",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      );
  }
}