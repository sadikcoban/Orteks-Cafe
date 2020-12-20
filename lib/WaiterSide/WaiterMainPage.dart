
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarWaiter.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class WaiterMainPage extends StatefulWidget {
  @override
  _WaiterMainPageState createState() => _WaiterMainPageState();
}

class _WaiterMainPageState extends State<WaiterMainPage> {
   String currentWaiter = null;
  List<String> WaiterList = ["Salih Mert", "Sadık", "Ziya", "Mehmet"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: ApplicationBar(Colors.white, Color(0xff329D9C), "ANASAYFA",
          Color(0xff329D9C), RefreshButton()),
          drawer: NavigationBarWaiter(),
          body: SiparisOzeti(),
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
   GenelSiparisler(BuildContext context, int index) {
    return ListTile(
      title: Text("Filtre Kahve",
          style: GoogleFonts.montserrat(
              color: Colors.white60, fontWeight: FontWeight.w400)),
      subtitle: Text("Süt eklencektir(2.5₺)",
          style: GoogleFonts.montserrat(
              color: Colors.white60, fontWeight: FontWeight.w400)),
      trailing: Text(
        "15.75₺",
        style: GoogleFonts.montserrat(
            color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
   SiparisOzeti() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => SiparisItem(context, index),
          ),
        ),
      ],
    );
  }
  SiparisItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ExpansionTileCard(
        baseColor: Colors.white,
        elevation: 15,
        initialElevation: 15,
        expandedColor: Color(0xff4D5B5D),
        shadowColor: Colors.black,
        title: Text("Arif Çalışkan",
            style: GoogleFonts.montserrat(
                color: Color(0xff329D9C), fontWeight: FontWeight.bold)),
        leading: Text(
          "14",
          style: GoogleFonts.montserrat(
              color: Color(0xff329D9C), fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          "19.75₺",
          style: GoogleFonts.montserrat(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        children: [
          Container(
            height: 250,
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  GenelSiparisler(context, index),
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }