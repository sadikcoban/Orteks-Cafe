import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/CustomerSide/ProductInformation.dart';
import 'package:MobilProject/services/service_reqs.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class CustomerProducts extends StatelessWidget {
  final String catName;
  CustomerProducts(this.catName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(Colors.white, Colors.white, catName,
          Color(0xff329D9C), AnimationTranstion.LogOut(context)),
      body: FutureBuilder(
          future: ServiceReqs().getProductsOfCategory(catName),
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
                return new GridView.count(
                  primary: true,
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  children: List.generate(
                    (snapshot.data.length / 3).round(),
                    (index) {
                      return ProductItem(
                        context,
                        index,
                        snapshot.data[index].name,
                        snapshot.data[index].image_url,
                        snapshot.data[index].id,
                      );
                    },
                  ),
                );
              }
            }
          }),
    );
  }

  Avatar(String adress) {
    return new Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(adress), fit: BoxFit.contain),
        boxShadow: [
          BoxShadow(
            color: Colors.white30,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
    );
  }

  ProductItem(
      BuildContext context, int index, String name, String image, String id) {
    var rand = new Random();
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GestureDetector(
        onTap: () {
          AnimationTranstion.AnimationPushWidget_LeftToRight(
              ProductInformation(
                productName: name,
                image: image,
                id: id,
                catName: catName,
              ),
              context);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 20,
          shadowColor: Colors.black,
          child: Column(
            children: [
              Hero(
                tag: index,
                child: Image.network(image + "/preview"),
              ),
              SizedBox(
                height: 8,
              ),
              AutoSizeText(
                name,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                (rand.nextDouble() * 40).toStringAsFixed(2) + " ₺",
                style: GoogleFonts.montserrat(
                  fontStyle: FontStyle.italic,
                  color: Color(0xff329D9C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
