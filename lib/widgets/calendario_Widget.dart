import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ejemplo extends StatefulWidget {
  const ejemplo({super.key});

  @override
  State<ejemplo> createState() => _ejemploState();
}

class _ejemploState extends State<ejemplo> {
  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datethereservate"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: TextField(
          controller: _date,
          decoration: InputDecoration(
            icon: Icon(Icons.calendar_today_rounded),
            labelText: "Select Date",
          ),
          onTap: ()async{
            DateTime? pickeddate = await showDatePicker(
              context: context, 
              initialDate: DateTime.now(), 
              firstDate: DateTime(2000), 
              lastDate: DateTime(2101),
            );
            if(pickeddate!= null){
              setState(() {
                _date.text =DateFormat("yyyy-MM-dd").format(pickeddate);
              });
            }
              
          },
        ),

      ),
    );
  }
}


class calendario_widget extends StatefulWidget {
  const calendario_widget({Key? key});

  @override
  State<calendario_widget> createState() => _calendario_widgetState();
}

class _calendario_widgetState extends State<calendario_widget> {
  String _dateRange = ''; // Variable para almacenar el rango de fechas seleccionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datethereservate"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: TextField(
          readOnly: true,
          controller: TextEditingController(text: _dateRange),
          decoration: InputDecoration(
            icon: Icon(Icons.calendar_today_rounded),
            labelText: "Select Date Range",
          ),
          onTap: () async {
            Container();
            final DateTimeRange? pickedDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),

            );
            if (pickedDateRange != null) {
              setState(() {
                // Formatea y guarda el rango de fechas seleccionado
                _dateRange = DateFormat("yyyy-MM-dd").format(pickedDateRange.start) +
                    ' - ' +
                    DateFormat("yyyy-MM-dd").format(pickedDateRange.end);
              });
            }
          },
        ),
      ),
    );
  }
}

