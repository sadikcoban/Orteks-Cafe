
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarAdmin.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [OrdersBody(), TableBody()];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(),
      drawer: NaavigationBarAdmin(),
      appBar: ApplicationBar(
          Colors.white,
          Color(0xff329D9C),
          currentIndex == 0 ? "SİPARİŞLER" : "MASALAR",
          Color(0xff329D9C),
          RefreshButton()),
      body: tabs[currentIndex],
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

  OrdersBody() {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) =>
              ExpandedCardforOrders(context, index),
          itemCount: 10,
        )),
      ],
    );
  }

  TableBody() {
    return new GridView.count(
      primary: true,
      crossAxisCount: 2,
      childAspectRatio: 0.80,
      children: List.generate(15, (index) {
        return TableCard(index);
      }),
    );
  }

  TableCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 15,
        shadowColor: Colors.black,
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.fitWidth,
                        child: Text("${index + 1}",

                  style: GoogleFonts.montserrat(
                    color: index % 3 == 0 ? Colors.red : Colors.green,
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListTile(
              title: index % 3 == 0
                  ? Center(
                    child: Container(
                        width: 50,
                        child: Row(
                          children: [
                            Text(
                              "15",
                              style: GoogleFonts.montserrat(color: Colors.red),
                            ),
                            Icon(Icons.timer)
                          ],
                        )),
                  )
                  : SizedBox(),
            ),
          ),
        ],
      )),
    );
  }

  ExpandedCardforOrders(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ExpansionTileCard(
        elevation: 15,
        initialElevation: 15,
        shadowColor: Colors.black,
        title: Text("Burak Kolukısa", style: GoogleFonts.montserrat()),
        leading:
            Text("11", style: GoogleFonts.montserrat(color: Color(0xff327D9D))),
        trailing: Container(
            width: 50,
            child: Row(
              children: [
                Text(
                  "15",
                  style: GoogleFonts.montserrat(color: Colors.red),
                ),
                Icon(Icons.timer)
              ],
            )),
        children: [
          Column(
            children: [
              Card(
                child: ListTile(
                  title: Text(
                    "Türk Kahvesi",
                    style: GoogleFonts.montserrat(),
                  ),
                  subtitle: Text(
                    "Orta Şekerli olacak",
                    style: GoogleFonts.montserrat(),
                  ),
                  trailing: Icon(
                    Icons.check_box,
                    color: Colors.green,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Filtre Kahve",
                    style: GoogleFonts.montserrat(),
                  ),
                  subtitle: Text(
                    "Süt Eklenecek",
                    style: GoogleFonts.montserrat(),
                  ),
                  trailing: Icon(
                    Icons.check_box,
                    color: Colors.green,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Mocha",
                    style: GoogleFonts.montserrat(),
                  ),
                  subtitle: Text(
                    "Çilekli Pasta",
                    style: GoogleFonts.montserrat(),
                  ),
                  trailing: Icon(
                    Icons.close_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Çay",
                    style: GoogleFonts.montserrat(),
                  ),
                  subtitle: Text(
                    "Çikolatalı Kurabiye",
                    style: GoogleFonts.montserrat(),
                  ),
                  trailing: Icon(
                    Icons.check_box,
                    color: Colors.green,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "Limonata",
                    style: GoogleFonts.montserrat(),
                  ),
                  subtitle: Text(
                    "Limonlu Kek",
                    style: GoogleFonts.montserrat(),
                  ),
                  trailing: Icon(
                    Icons.close_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  BottomNavigationBar() {
    return CurvedNavigationBar(
      backgroundColor: Color(0xff329D9C),
      items: <Widget>[
        AnimationTranstion.Avatar(
            "order", Colors.black, BoxFit.scaleDown, 30, 30),
        AnimationTranstion.Avatar(
            "dining-table", Colors.black, BoxFit.scaleDown, 30, 30),
      ],
      onTap: (index) {
        setState(() {
          currentIndex = index;
          print(currentIndex);
        });
      },
    );
  }
}
