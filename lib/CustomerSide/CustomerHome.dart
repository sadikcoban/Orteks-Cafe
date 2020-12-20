
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';

class CustomerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(Colors.white, Colors.white, "ANASAYFA",
          Color(0xff329D9C),AnimationTranstion.LogOut(context)),
      body: FirstScreen(context),
    );
  }
  FirstScreen(BuildContext context) {
    return Stack(
          children: [
            AnimationTranstion.AvatarWithoutColor("CustomerBackground", BoxFit.cover,  MediaQuery.of(context).size.height,  MediaQuery.of(context).size.width,),
             Container(
        child: Column(
          children: [
            Expanded(
                  child: ListView.builder(
                  itemBuilder: (context, index) => ContainerItem(context, index)),
            ),
          ],
        ),
      ),
          ],
    );
  }

  ContainerItem(BuildContext context, int index) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/KahveReklami.jpg"),
                    fit: BoxFit.cover)),
          ),
        ),
        ListTile(
          title: Text("Arkadaşını Getir Kahveyi Götür",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
          subtitle: Text(
              "Arkadışını referans kodu ile kaydettirene bir kahve Orteks kahveden hediye.Haydi Herkes Orteks Kafeye..."),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

}