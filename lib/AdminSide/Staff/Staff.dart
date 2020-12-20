
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarAdmin.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Staff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NaavigationBarAdmin(),
      appBar: ApplicationBar(Colors.white, Color(0xff329D9C), "PERSONELLER",
          Color(0xff329D9C), RefreshButton()),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              CardItem(Colors.blue, "Görev Verildi", "Mehmet BALIK"),
               CardItem(Colors.red, "Türk Kahvesi Hazırlıyor", "Salih Mert ATALAY"),
                CardItem(Colors.green, "Boşta", "Sadık ÇOBAN"),
                 CardItem(Colors.red, "Çay Hazırlıyor", "Ziya DENİZ"),
            ],
          )
        ],
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
  CardItem(Color color, String Mission, String StaffName) {
    return ExpansionTileCard(
      leading: AnimationTranstion.Avatar(
          "waiter", Colors.black, BoxFit.contain, 30, 30),
      title: Text(
        StaffName,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        Mission,
        style: GoogleFonts.montserrat(color: color),
      ),
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Card(
                child: ListTile(
                  title: Text("Günlük Toplam Müşteri",style: GoogleFonts.montserrat(color: Colors.black87,),),
                  trailing: Text("18",style: GoogleFonts.montserrat(color: Colors.green[900]),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Card(
                elevation: 5,
                shadowColor: Colors.black,
                child: ListTile(
                  title: Text("Günlük Verilen Ürün",style: GoogleFonts.montserrat(color: Colors.black87,),),
                  trailing: Text("96",style: GoogleFonts.montserrat(color: Colors.green[900]),),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
