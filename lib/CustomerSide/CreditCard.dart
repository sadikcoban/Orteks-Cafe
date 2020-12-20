
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(
          Colors.white, Colors.white, "ÖDEME", Color(0xff329D9C), AnimationTranstion.LogOut(context)),
      body: ListView(
        children: [
          Column(
            children: [Balance(), Sepet(), ExpandedCardforOrders(),SizedBox(height: 280,),ButtonStyleLogin(context)],
          ),
        ],
      ),
    );
  }

  ButtonStyleLogin(BuildContext context) {
    return GestureDetector(
      child: new Container(
        height: AnimationTranstion.uzunlukFonksiyonu(40, context),
        width: AnimationTranstion.genislikFonksiyonu(152, context),
        decoration: BoxDecoration(
          color: Color(0xffF18634),
          borderRadius: BorderRadius.circular(6.00),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: new Text(
            "Ödeme Yap",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Sepet() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ExpansionTileCard(
        shadowColor: Colors.blue[900],
        initialElevation: 15,
        elevation: 15,
        baseColor: Color(0xff329D9C),
        expandedColor: Color(0xff329D9C),
        title: Text("SEPET",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        leading: AnimationTranstion.Avatar(
            "order", Colors.white, BoxFit.scaleDown, 30, 30),
        subtitle: Text(
          "Seçtiğiniz ürünleri görmek için tıklayınız.",
          style: GoogleFonts.montserrat(
            color: Colors.white60,
          ),
        ),
        trailing: Text(
          "186.85 ₺",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        children: [
          Column(
            children: [
              Container(
                  height: 400,
                  child: ListView.builder(
                      itemBuilder: (context, index) =>
                          PruductsItem(context, index))),
            ],
          )
        ],
      ),
    );
  }

  ExpandedCardforOrders() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ExpansionTileCard(
        elevation: 15,
        initialElevation: 15,
        baseColor: Color(0xff327D9D),
        expandedColor: Color(0xff327D9D),
        shadowColor: Colors.black,
        title: Text("SİPARİŞLER",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        leading: AnimationTranstion.Avatar(
            "OrderFood", Colors.white, BoxFit.scaleDown, 40, 40),
        subtitle: Text(
          "Seçtiğiniz ürünleri görmek için tıklayınız.",
          style: GoogleFonts.montserrat(
            color: Colors.white60,
          ),
        ),
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

  PruductsItem(BuildContext context, int index) {
    return Card(
      color: Color(0xff329D9C),
      child: ListTile(
          leading: Image.asset("images/kahveResmi.jpg"),
          title: Text(
            "Filtre Kahve",
            style: GoogleFonts.montserrat(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            "Süt(2.5 ₺)",
            style: GoogleFonts.montserrat(color: Colors.white70),
          ),
          trailing: Text("18.50 ₺",
              style: GoogleFonts.montserrat(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ))),
    );
  }

  Balance() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shadowColor: Colors.black,
        elevation: 10,
        child: ListTile(
          title: Text(
            "124.00 ₺",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w900,
            ),
          ),
          subtitle: Text(
              "Dilerseniz NFC ile pos cihazınızdan ödeme yapabilirsinniz.Ayrıca promosyon liralarnızı da harcayarak alışveriş yapabilirsiniz."),
          trailing: AnimationTranstion.AvatarWithoutColor(
            "CreditCard",
            BoxFit.cover,
            40,
            40,
          ),
        ),
      ),
    );
  }
}
