import 'dart:io';
import 'dart:math';

import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarAdmin.dart';
import 'package:MobilProject/services/service_reqs.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Product extends StatefulWidget {
  final String productId;
  final String name;

  Product(this.productId, this.name);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<String> subProducts = ["Süt", "Çikolatalı Kurabiye", "Elma Şurubu"];
  int totalSize = 0;
  String currentItem = null;
  final picker = ImagePicker();
  TextEditingController NameController = new TextEditingController();
  TextEditingController explainController = new TextEditingController();
  TextEditingController PriceController = new TextEditingController();
  File BuyukResim = null;
  int resimIndexi;
  List<File> resimler = new List<File>();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ServiceReqs().getOneProduct(widget.productId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: ApplicationBar(
              Colors.white,
              Color(0xff329D9C),
              widget.name,
              Color(0xff329D9C),
              SizedBox(),
            ),
            drawer: NaavigationBarAdmin(),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.data == null) {
            return Scaffold(
              appBar: ApplicationBar(
                Colors.white,
                Color(0xff329D9C),
                widget.name,
                Color(0xff329D9C),
                SizedBox(),
              ),
              drawer: NaavigationBarAdmin(),
              body: Center(
                child: Text("En error occured, please try again"),
              ),
            );
          } else {
            NameController.text = snapshot.data[0].name;
            explainController.text = snapshot.data[0].desc;
            PriceController.text =
                (new Random().nextDouble() * 40).toStringAsFixed(2);
            return Scaffold(
              appBar: ApplicationBar(
                Colors.white,
                Color(0xff329D9C),
                widget.name,
                Color(0xff329D9C),
                SizedBox(),
              ),
              drawer: NaavigationBarAdmin(),
              body: SafeArea(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Column(
                      children: [
                        SizedBox(
                          height:
                              AnimationTranstion.uzunlukFonksiyonu(25, context),
                        ),
                        BuyukFotoContainer(),
                        SizedBox(
                          height:
                              AnimationTranstion.uzunlukFonksiyonu(20, context),
                        ),
                        resimler.isNotEmpty
                            ? Container(
                                height: 90,
                                child: ListView.builder(
                                  itemBuilder: (context, index) =>
                                      KucukFotoContainer(
                                    context,
                                    index,
                                  ),
                                  itemCount: resimler.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 20,
                        ),
                        TextFieldContainer(
                          NameController,
                          40,
                          "Product Name",
                          Icon(Icons.border_color),
                          TextInputType.emailAddress,
                        ),
                        TextFieldContainer(
                          explainController,
                          40,
                          "Explanation",
                          Icon(Icons.border_color),
                          TextInputType.emailAddress,
                        ),
                        TextFieldContainer(
                          PriceController,
                          40,
                          "Product Price",
                          Icon(Icons.monetization_on),
                          TextInputType.number,
                        ),
                        ChoosenSubProducts(),
                      ],
                    )
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color(0xff329D9C),
                  child: Icon(
                    Icons.check,
                  ),
                  elevation: 12),
            );
          }
        }
      },
    );
  }

  KucukFotoContainer(BuildContext context, int index) {
    File Image = resimler[index];
    return Row(
      children: <Widget>[
        SizedBox(
          width: AnimationTranstion.genislikFonksiyonu(15, context),
        ),
        GestureDetector(
          child: new Container(
            height: AnimationTranstion.uzunlukFonksiyonu(70, context),
            width: AnimationTranstion.genislikFonksiyonu(82, context),
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: FileImage(Image), fit: BoxFit.cover),
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(20.00),
            ),
          ),
          onTap: () {
            setState(() {
              resimIndexi = index;
              BuyukResim = resimler[index];
            });
          },
        ),
        SizedBox(
          width: AnimationTranstion.genislikFonksiyonu(15, context),
        ),
      ],
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
        title: AutoSizeText(
          "By-Products",
          style: GoogleFonts.montserrat(color: Colors.blueGrey),
        ),
        trailing: Container(
          width: 110,
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
                  height: (55 * totalSize).toDouble(),
                  child: ListView.builder(
                    itemBuilder: (context, index) => chooseItem(context, index),
                    itemCount: totalSize,
                  ))
              : SizedBox()
        ],
      ),
    );
  }

  TextFieldContainer(TextEditingController controller, int limit, String Baslik,
      Icon icon_exp, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: new InputDecoration(
          focusColor: Color(0xff329D9C),
          focusedBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Color(0xff329D9C))),
          enabledBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Color(0xff329D9C))),
          filled: true,
          prefixIcon: icon_exp,
          fillColor: Colors.white,
          labelText: Baslik,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        keyboardType: type,
      ),
    );
  }

  BuyukFotoContainer() {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        child: new Container(
          height: AnimationTranstion.uzunlukFonksiyonu(230, context),
          width: AnimationTranstion.genislikFonksiyonu(330, context),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            image: BuyukResim != null
                ? DecorationImage(
                    image: FileImage(BuyukResim), fit: BoxFit.scaleDown)
                : null,
            boxShadow: [
              BoxShadow(
                offset: Offset(3.00, 10.00),
                color: Color(0xff000000).withOpacity(0.16),
                blurRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.circular(23.00),
          ),
          child: BuyukResim == null ? Icon(Icons.photo_camera) : null,
        ),
        onTap: () {
          EkleVeyaSil(
              "Choose One of These",
              "Yeni Fotoğraf  Eklemek mi istersiniz, ya da bu fotoğrafı silmek mi istersiniz?",
              context,
              DialogType.INFO);
        },
      ),
    );
  }

  chooseItem(BuildContext context, int index) {
    return Padding(
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
    );
  }

  EkleVeyaSil(
    String baslik,
    String aciklama,
    BuildContext context,
    DialogType dialogType,
  ) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.LEFTSLIDE,
      title: baslik,
      desc: aciklama,
      btnCancelText: "FOTOGRAF EKLEME",
      btnCancelIcon: Icons.photo_camera,
      btnOkIcon: Icons.delete_sweep,
      btnCancelColor: Colors.grey,
      btnOkColor: Colors.grey,
      btnOkText: "FOTOGRAF SİL",
      btnCancelOnPress: () {
        CameravsGallery(
            "Seçim Aşaması",
            "Yeni Fotoğraf  Çekmek mi istersiniz, ya da bu fotoğrafı eklemek mi istersiniz?",
            context,
            DialogType.INFO);
      },
      btnOkOnPress: () {
        SonKararMi(
            "Seçim Aşaması",
            "Bu Fotoğrafi Sİlmek İStediğiniz Emin misiniz?",
            context,
            DialogType.WARNING);
      },
    )..show();
  }

  CameravsGallery(
    String baslik,
    String aciklama,
    BuildContext context,
    DialogType dialogType,
  ) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.BOTTOMSLIDE,
      title: baslik,
      desc: aciklama,
      btnCancelText: "KAMERA",
      btnCancelIcon: Icons.photo_camera,
      btnOkIcon: Icons.photo,
      btnCancelColor: Colors.grey,
      btnOkColor: Colors.grey,
      btnOkText: "GALERİ",
      btnCancelOnPress: () {
        getImagefromCamera();
      },
      btnOkOnPress: () {
        getImageFromGallery();
      },
    )..show();
  }

  Future getImagefromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      resimler.add(File(pickedFile.path));
      BuyukResim = resimler.last;
      resimIndexi = resimler.length - 1;
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      resimler.add(File(pickedFile.path));
      BuyukResim = resimler.last;
      resimIndexi = resimler.length - 1;
    });
  }

  SonKararMi(
    String baslik,
    String aciklama,
    BuildContext context,
    DialogType dialogType,
  ) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.BOTTOMSLIDE,
      title: baslik,
      desc: aciklama,
      btnCancelText: "HAYIR",
      btnCancelIcon: Icons.cancel,
      btnOkIcon: Icons.delete_forever,
      btnCancelColor: Colors.grey,
      btnOkColor: Colors.grey,
      btnOkText: "EVET",
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        setState(() {
          if (resimler.length == 0) {
          } else if (resimler.length == 1) {
            BuyukResim = null;
            resimler.removeAt(resimIndexi);
          } else {
            resimler.removeAt(resimIndexi);
            resimIndexi = resimler.length - 1;
            BuyukResim = resimler.last;
          }
        });
      },
    )..show();
  }
}
