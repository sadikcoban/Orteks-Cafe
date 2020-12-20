import 'package:MobilProject/AdminSide/Products/AddProduct.dart';
import 'package:MobilProject/AdminSide/Products/Product.dart';
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarAdmin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Products extends StatelessWidget {
  final String category_id;
  final String category_name;
  Products(
    this.category_id,
    this.category_name,
  );
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        /*  stream: FirebaseFirestore.instance
            .collection("products")
            .where("category_id", isEqualTo: this.category_id)
            .snapshots(), */
        builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Scaffold(
          appBar: ApplicationBar(Colors.white, Color(0xff329D9C), category_name,
              Color(0xff329D9C), AddNewProducts(context)),
          drawer: NaavigationBarAdmin(),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        final products = snapshot.data.documents;
        if (products.length == 0) {
          return Scaffold(
            appBar: ApplicationBar(Colors.white, Color(0xff329D9C),
                category_name, Color(0xff329D9C), AddNewProducts(context)),
            drawer: NaavigationBarAdmin(),
            body: Center(
              child: Text(
                  "There is no existing product for the $category_name category"),
            ),
          );
        } else {
          print(products.length.toString());
          return Scaffold(
            appBar: ApplicationBar(Colors.white, Color(0xff329D9C),
                category_name, Color(0xff329D9C), AddNewProducts(context)),
            drawer: NaavigationBarAdmin(),
            body: new GridView.count(
              primary: true,
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              children: List.generate(
                products.length,
                (index) {
                  return ProductItem(
                    context,
                    products[index].documentID,
                    products[index]["name"],
                    products[index]["image_url"],
                    products[index]["price"].toDouble(),
                  );
                },
              ),
            ),
          );
        }
      }
    });
  }

  AddNewProducts(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.add,
        color: Color(0xff329D9C),
        size: 35,
      ),
      onPressed: () {
        AnimationTranstion.AnimationPushWidget_LeftToRight(
            AddProduct(category_id, category_name), context);
      },
    );
  }

  Avatar(String adress) {
    return new Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(adress),
          fit: BoxFit.contain,
        ),
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

  ProductItem(BuildContext context, String id, String name, String imageUrl,
      double price) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GestureDetector(
        onTap: () {
          AnimationTranstion.AnimationPushWidget_LeftToRight(
              Product(id, name), context);
        },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 20,
            shadowColor: Colors.black,
            child: Column(
              children: [
                Image.network(imageUrl),
                SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  "$price ₺",
                  style: GoogleFonts.montserrat(
                    fontStyle: FontStyle.italic,
                    color: Color(0xff329D9C),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    onPressed: () {})
              ],
            )),
      ),
    );
  }
}
