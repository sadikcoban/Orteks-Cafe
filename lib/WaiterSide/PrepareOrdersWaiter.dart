
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarWaiter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrepareOrdersWaiter extends StatefulWidget {
  @override
  _PrepareOrdersWaiterState createState() => _PrepareOrdersWaiterState();
}

class _PrepareOrdersWaiterState extends State<PrepareOrdersWaiter> {
  int PreparingItem = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(Colors.white, Color(0xff329D9C), "HAZIRLANACAKLAR",
          Color(0xff329D9C), RefreshButton()),
      drawer: NavigationBarWaiter(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => OrderItem(context, index),
            itemCount: 10,
          )),
        ],
      ),
    );
  }

  OrderItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 11,
        shadowColor: Colors.black,
        child: ListTile(
            leading: IconButton(icon: Icon(Icons.check,color: Colors.green,), onPressed: null),
        title: Text(
          "16 tane Çay",
          style: GoogleFonts.montserrat(),
        ),
      trailing: Container(width: 120,child:   Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      PreparingItem--;
                    });
                  }),
              Text("$PreparingItem",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                    onPressed: () {
                    setState(() {
                      PreparingItem++;
                    });
                  }), 
            ],
          ),),
        ),
      ),
    );
  }

  RefreshButton() {
    return IconButton(
        icon: Icon(
          Icons.refresh,
          color: Color(0xff329D9C),
        ),
        onPressed: null);
  }
}
