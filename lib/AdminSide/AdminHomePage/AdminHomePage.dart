
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarAdmin.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  String currentWaiter = null;
  List<String> WaiterList = ["Salih Mert", "Sadık", "Ziya", "Mehmet"];
  bool birG = true;
  bool birH = false;
  bool birA = false;
  bool birY = false;
  bool yukleme = true;
  int faturaID;
  String GHAY_Yazi = "Daily Profit";
  double GHAY_Para = 196.14;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(
          Colors.white, Color(0xff329D9C), "Dashboard", Color(0xff329D9C),SizedBox()),
      drawer: NaavigationBarAdmin(),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: AnimationTranstion.uzunlukFonksiyonu(25, context),
              ),
              KazancBilgisi(GHAY_Para),
              SizedBox(
                height: AnimationTranstion.uzunlukFonksiyonu(15, context),
              ),
              HaftalikAylikYillik(GHAY_Yazi),
              SizedBox(
                height: AnimationTranstion.uzunlukFonksiyonu(25, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Gunluk(187.45),
                  Haftalik(96.57),
                  Aylik(1084.87),
                  Yillik(42.55)
                ],
              ),
              SizedBox(
                height: AnimationTranstion.uzunlukFonksiyonu(50, context),
              ),
              GarsonlarinDurumu(),
              SizedBox(
                height: AnimationTranstion.uzunlukFonksiyonu(50, context),
              ),
              SiparisOzeti(),
            ],
          )
        ],
      ),
    );
  }

  KazancBilgisi(double para) {
    return new Text(
      "$para ₺",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "SF UI Text",
        fontWeight: FontWeight.w500,
        fontSize: AnimationTranstion.uzunlukFonksiyonu(46, context),
        color: Color(0xff0f0f0f),
      ),
    );
  }

  HaftalikAylikYillik(String FonsksiyonYazisi) {
    return new Text(
      FonsksiyonYazisi,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "SF UI Text",
        fontWeight: FontWeight.w600,
        fontSize: AnimationTranstion.uzunlukFonksiyonu(13, context),
        color: Color(0xffb4b4b4),
      ),
    );
  }

  Gunluk(double para) {
    return GestureDetector(
      child: new Text(
        "1D",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "SF UI Text",
          fontWeight: FontWeight.w600,
          fontSize: AnimationTranstion.uzunlukFonksiyonu(17, context),
          color: birG ? Color(0xff21ce99) : Color(0xffb4b4b4),
        ),
      ),
      onTap: () {
        setState(() {
          birG = true;
          birH = false;
          birA = false;
          birY = false;
          GHAY_Yazi = "Daily Profit";
          GHAY_Para = para;
        });
      },
    );
  }

  Haftalik(double para) {
    return GestureDetector(
      child: new Text(
        "1W",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "SF UI Text",
          fontWeight: FontWeight.w600,
          fontSize: AnimationTranstion.uzunlukFonksiyonu(17, context),
          color: birH ? Color(0xff21ce99) : Color(0xffb4b4b4),
        ),
      ),
      onTap: () {
        setState(() {
          birH = true;
          birG = false;
          birA = false;
          birY = false;
          GHAY_Yazi = "Weekly Profit";
          GHAY_Para = para;
        });
      },
    );
  }

  Aylik(double para) {
    return GestureDetector(
      child: new Text(
        "1M",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "SF UI Text",
          fontWeight: FontWeight.w600,
          fontSize: AnimationTranstion.uzunlukFonksiyonu(17, context),
          color: birA ? Color(0xff21ce99) : Color(0xffb4b4b4),
        ),
      ),
      onTap: () {
        setState(() {
          birA = true;
          birH = false;
          birG = false;
          birY = false;
          GHAY_Yazi = "Monthly Profit";
          GHAY_Para = para;
        });
      },
    );
  }

  Yillik(double para) {
    return GestureDetector(
      child: new Text(
        "1Y",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "SF UI Text",
          fontWeight: FontWeight.w600,
          fontSize: AnimationTranstion.uzunlukFonksiyonu(17, context),
          color: birY ? Color(0xff21ce99) : Color(0xffb4b4b4),
        ),
      ),
      onTap: () {
        setState(() {
          birY = true;
          birH = false;
          birA = false;
          birG = false;
          GHAY_Yazi = "Annual Profit";
          GHAY_Para = para;
        });
      },
    );
  }

  GarsonlarinDurumu() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ExpansionTileCard(
        expandedColor: Color(0xff4D5B5D),
        elevation: 15,
        initialElevation: 15,
        shadowColor: Colors.black,
        title: Text(
          "Staff Members",
          style: GoogleFonts.montserrat(
              color: Color(0xff329D9C), fontWeight: FontWeight.bold),
        ),
        leading: AnimationTranstion.Avatar(
            "cafe", Color(0xff329D9C), BoxFit.contain, 50, 50),
        children: [
          Column(
            children: [
              ListTile(
                leading: AnimationTranstion.Avatar(
                    "waiter", Colors.white54, BoxFit.contain, 30, 30),
                title: Text(
                  "Salih Mert ATALAY",
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Şu An Latte Hazırlıyor.",
                  style: GoogleFonts.montserrat(
                      color: Colors.red, fontWeight: FontWeight.w400),
                ),
              ),
              ListTile(
                leading: AnimationTranstion.Avatar(
                    "waiter", Colors.white54, BoxFit.contain, 30, 30),
                title: Text(
                  "Sadık ÇOBAN",
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Görev Verildi",
                  style: GoogleFonts.montserrat(
                      color: Colors.blue, fontWeight: FontWeight.w400),
                ),
              ),
              ListTile(
                leading: AnimationTranstion.Avatar(
                    "waiter", Colors.white54, BoxFit.contain, 30, 30),
                title: Text(
                  "Merhmet BALIK",
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Boşta",
                  style: GoogleFonts.montserrat(
                      color: Colors.green, fontWeight: FontWeight.w400),
                ),
              ),
              ListTile(
                leading: AnimationTranstion.Avatar(
                    "waiter", Colors.white54, BoxFit.contain, 30, 30),
                title: Text(
                  "Ziya DENİZ",
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Şu An Mocha Hazırlıyor.",
                  style: GoogleFonts.montserrat(
                      color: Colors.red, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  SiparisOzeti() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ExpansionTileCard(
        expandedColor: Color(0xff4D5B5D),
        elevation: 15,
        initialElevation: 15,
        shadowColor: Colors.black,
        title: Text(
          "Redirect the Orders",
          style: GoogleFonts.montserrat(
              color: Color(0xff329D9C), fontWeight: FontWeight.bold),
        ),
        leading: AnimationTranstion.Avatar(
            "OrderFood",Color(0xff329D9C), BoxFit.contain, 50, 50),
        children: [
          Column(
            children: [
              Container(
                height: 400,
                child: Swiper(
                  itemCount: 4,
                  itemBuilder: (context, index) => SiparisItem(context, index),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
OkeyButton() {
    return new Container(
      height: 30.00,
      width: 80.00,
      decoration: BoxDecoration(
        color: Color(0xff329D9C),
        borderRadius: BorderRadius.circular(13.00),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: new Text(
          "Redirect",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Montserrat-Bold",
            color: Color(0xfffbfbfb),
          ),
        ),
      ),
    );
  }
  SiparisItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ExpansionTileCard(
            baseColor: Colors.white30,
            initiallyExpanded: true,
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
                  color: Colors.white, fontWeight: FontWeight.bold),
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ WaiterDropDown(),OkeyButton(),],),
        ],
      ),
    );
  }

  WaiterDropDown() {
      return Container(
        child: DropdownButton(
          value: currentWaiter,
          hint: new Text("Choose a Staff",style: TextStyle(color: Colors.white70),),
          icon: Icon(Icons.arrow_downward),
          underline: Container(
            height: 2,
            color:Color(0xff0d836f),
          ),
          onChanged: (newValue) {
            setState(() {
              currentWaiter = newValue;
            });
          },
          items: WaiterList.map((String waiter) {
            return new DropdownMenuItem(
              value: waiter,
              child: Center(
                child: new Text(
                  waiter,
                  style: new TextStyle(color: Colors.grey),
                ),
              ),
            );
          }).toList(),
        ),
      );
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
}
