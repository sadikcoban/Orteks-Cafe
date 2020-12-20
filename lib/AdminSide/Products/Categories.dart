
import 'package:MobilProject/AdminSide/Products/Products.dart';
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarAdmin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        //stream: FirebaseFirestore.instance.collection("categories").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              appBar: ApplicationBar(Colors.white, Color(0xff329D9C),
                  "KATEGORİLER", Color(0xff329D9C), AddNewCategories()),
              drawer: NaavigationBarAdmin(),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            final categories = snapshot.data.documents;
            if (categories.length == 0) {
              return Scaffold(
                appBar: ApplicationBar(Colors.white, Color(0xff329D9C),
                    "KATEGORİLER", Color(0xff329D9C), AddNewCategories()),
                drawer: NaavigationBarAdmin(),
                body: Center(
                  child: Text("No category created yet"),
                ),
              );
            } else {
              return Scaffold(
                appBar: ApplicationBar(Colors.white, Color(0xff329D9C),
                    "KATEGORİLER", Color(0xff329D9C), AddNewCategories()),
                drawer: NaavigationBarAdmin(),
                body: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: categories.length,
                          itemBuilder: (context, index) => CategoriCard(
                            context,
                            index,
                            categories[index].documentID,
                            categories[index]["name"],
                            categories[index]["image_url"],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        });
  }

  CategoriCard(BuildContext context, int index, String id, String name,
      String imageUrl) {
    print(id);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () => AnimationTranstion.AnimationPushWidget_LeftToRight(
            Products(id, name), context),
        child: Card(
          elevation: 15,
          shadowColor: Colors.black,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                name,
                style: GoogleFonts.montserrat(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            trailing: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
          ),
        ),
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

  AddNewCategories() {
    return IconButton(
        icon: Icon(
          Icons.add,
          color: Color(0xff329D9C),
          size: 35,
        ),
        onPressed: null);
  }
}
