import 'dart:ui';
import 'package:MobilProject/CustomerSide/CustomerProdeucts.dart';
import 'package:MobilProject/services/service_reqs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';

class Menu extends StatelessWidget {
  double _sigmaX = 4.0; // from 0-10
  double _sigmaY = 4.0; // from 0-10
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ApplicationBar(Colors.white, Colors.white, "MENÜ",
            Color(0xff329D9C), AnimationTranstion.LogOut(context)),
        body: FutureBuilder(
            future: ServiceReqs().getCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("No data"),
                  );
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) => MenuItem(
                      context,
                      snapshot.data[index].name,
                      snapshot.data[index].image_url,
                    ),
                    itemCount: snapshot.data.length,
                  );
                }
              }
            }));
  }

  MenuItem(
    BuildContext context,
    String name,
    String image,
  ) {
    return GestureDetector(
      onTap: () => AnimationTranstion.AnimationPushWidget_LeftToRight(
          CustomerProducts(name), context),
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(image+"/preview"),
                fit: BoxFit.cover)),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
            child: new Container(
              child: Center(
                  child: Text(
                name,
                style:
                    GoogleFonts.montserrat(fontSize: 25, color: Colors.white),
              )),
              decoration:
                  new BoxDecoration(color: Colors.black.withOpacity(0.4)),
            ),
          ),
        ),
      ),
    );
  }
}
