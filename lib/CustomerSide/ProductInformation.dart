import 'dart:math';

import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/services/service_reqs.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductInformation extends StatefulWidget {
  const ProductInformation(
      {Key key, this.productName, this.image, this.id, this.catName})
      : super(key: key);
  final String productName;
  final String image;
  final String id;
  final String catName;
  @override
  _ProductInformationState createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  TextEditingController textEditingController = new TextEditingController();
  List<String> subProducts = ["Süt", "Çikolatalı Kurabiye", "Elma Şurubu"];
  String currentItem = null;
  int totalSize = 0;
  int PreparingItem = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 100.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(widget.productName,
                      style: GoogleFonts.montserrat(
                        color: Color(0xff329D9C),
                      )),
                  background: Hero(
                    tag: 1,
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
          ];
        },
        body: FutureBuilder(
            future: ServiceReqs().getOneProduct(widget.id),
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
                  return Column(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: AboutProduct(
                          snapshot.data[0].desc.toString(),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: ChoosenSubProducts(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Aciklama(textEditingController),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NumberOfPruducts(),
                            ButtonStyleLogin(context),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RecommendedHeader(),
                      ),
                      Expanded(
                        flex: 7,
                        child: RecommendedProducts(widget.catName),
                      ),
                    ],
                  );
                }
              }
            }),
      ),
    );
  }

  ButtonStyleLogin(BuildContext context) {
    return GestureDetector(
      child: new Container(
        height: AnimationTranstion.uzunlukFonksiyonu(40, context),
        width: AnimationTranstion.genislikFonksiyonu(152, context),
        decoration: BoxDecoration(
          color: Color(0xff329D9C),
          borderRadius: BorderRadius.circular(6.00),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: new Text(
            "Sepete Ekle",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }

  NumberOfPruducts() {
    return Container(
      width: 160,
      child: Row(
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
      ),
    );
  }

  AboutProduct(String desc) {
    return ListTile(
      title: Text(
        widget.productName,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.w800),
      ),
      subtitle: Text(
        desc,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
      ),
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

  ProductItem(BuildContext context, int index, String name, String image) {
    var rand = new Random();
    String price = (rand.nextDouble() * 40).toStringAsFixed(2);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 100,
        width: 100,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 20,
            shadowColor: Colors.black,
            child: Column(
              children: [
                Image.network(image + "/preview"),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: AutoSizeText(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: Colors.blueGrey,
                      fontSize: 8,
                    ),
                  ),
                ),
                AutoSizeText(
                  "$price ₺",
                  style: GoogleFonts.montserrat(
                    fontStyle: FontStyle.italic,
                    color: Color(0xff329D9C),
                    fontSize: 10,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  RecommendedHeader() {
    return Text("ÖNERİLEN ÜRÜNLER",
        style: GoogleFonts.montserrat(
            color: Colors.black, fontWeight: FontWeight.w700));
  }

  RecommendedProducts(String catName) {
    return Container(
      height: 200,
      width: 500,
      child: FutureBuilder(
          future: ServiceReqs().getRecommendedProducts(catName),
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
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductItem(
                    context,
                    index,
                    snapshot.data[index].name,
                    snapshot.data[index].image_url,
                  ),
                  itemCount: 5,
                );
              }
            }
          }),
    );
  }

  ChoosenSubProducts() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: new ExpansionTileCard(
        elevation: 15,
        initialElevation: 15,
        shadowColor: Colors.black,
        leading: AnimationTranstion.AvatarWithoutColor(
            "subProducts", BoxFit.scaleDown, 50, 50),
        title: Text(
          "Yan Ürünler",
          style: GoogleFonts.montserrat(color: Colors.blueGrey),
        ),
        trailing: Container(
          width: 120,
          child: Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      totalSize--;
                    });
                  }),
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      totalSize++;
                    });
                  }),
            ],
          ),
        ),
        children: [
          totalSize != 0
              ? Container(
                  height: (80 * totalSize).toDouble(),
                  child: ListView.builder(
                    itemBuilder: (context, index) => chooseItem(context, index),
                    itemCount: totalSize,
                  ))
              : SizedBox()
        ],
      ),
    );
  }

  Aciklama(TextEditingController _controller) {
    return Padding(
      padding: EdgeInsets.all(
        AnimationTranstion.uzunlukFonksiyonu(8, context),
      ),
      child: TextField(
        controller: _controller,
        style: TextStyle(
          color: Colors.black,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(350),
        ],
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: new InputDecoration(
          focusColor: Color(0xff329D9C),
          focusedBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Colors.grey)),
          filled: true,
          prefixIcon: Icon(Icons.adjust_sharp),
          fillColor: Colors.white,
          labelText: "Özel Açıklama",
          labelStyle: TextStyle(
            color: Color(0xff329D9C),
          ),
        ),
      ),
    );
  }

  chooseItem(BuildContext context, int index) {
    return Column(
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: new Container(
              height: 40.00,
              width: 300.00,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(
                  width: 1.00,
                  color: Color(0xff329D9C),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(34.00, 34.00),
                    color: Color(0xff329d9c).withOpacity(0.08),
                    blurRadius: 89,
                  ),
                ],
                borderRadius: BorderRadius.circular(21.00),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  elevation: 5,
                  isExpanded: true,
                  value: currentItem,
                  hint: new Text(
                    "Yan Ürün",
                    style: GoogleFonts.montserrat(),
                  ),
                  icon: Icon(Icons.keyboard_arrow_down),
                  onChanged: (newValue) {
                    setState(() {
                      currentItem = newValue;
                    });
                  },
                  items: subProducts.map((String item) {
                    return new DropdownMenuItem(
                      value: item,
                      child: new Text(
                        item,
                        style: new TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          trailing: Text("2.5 ₺",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
