import 'dart:io';
import 'package:MobilProject/AdminSide/Products/Products.dart';
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/AwesomeD%C4%B0alogClass.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarAdmin.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  final String categoryID;
  final String categoryName;
  AddProduct(this.categoryID, this.categoryName);
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isLoading = false;
  final _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> subProducts = ["Süt", "Çikolatalı Kurabiye", "Elma Şurubu"];
  int totalSize = 0;
  String currentItem = null;
  final picker = ImagePicker();
  TextEditingController nameController = new TextEditingController();
  TextEditingController explainController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  File BuyukResim = null;
  int resimIndexi;
  List<File> resimler = new List<File>();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: ApplicationBar(
        Colors.white,
        Color(0xff329D9C),
        "Add Product",
        Color(0xff329D9C),
        SizedBox(),
      ),
      drawer: NaavigationBarAdmin(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Form(
                key: _formKey,
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
                          nameController,
                          40,
                          "Product Name",
                          Icon(Icons.border_color),
                          TextInputType.emailAddress,
                          1,
                        ),
                        TextFieldContainer(
                          explainController,
                          200,
                          "Explanation",
                          Icon(Icons.border_color),
                          TextInputType.emailAddress,
                          5,
                        ),
                        TextFieldContainer(
                          priceController,
                          40,
                          "Product Price",
                          Icon(Icons.monetization_on),
                          TextInputType.number,
                          1,
                        ),
                        ChoosenSubProducts(),
                        SizedBox(
                          height: 20,
                        ),
                        AddButton(
                          context,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }

  AddButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();
        var isValid = _formKey.currentState.validate();
        if (BuyukResim == null) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text("Please insert an image"),
            ),
          );
          isValid = false;
          return;
        }
        if (isValid) {
         /*  setState(() {
            isLoading = true;
          });
          var storageRef = FirebaseStorage.instance
              .ref()
              .child("product_images")
              .child(randomString(10) + ".jpg");
          await storageRef.putFile(BuyukResim).whenComplete(() {});

          final imageUrl = await storageRef.getDownloadURL();

          FirebaseFirestore.instance.collection("products").add(
            {
              "name": nameController.text,
              "explain": explainController.text,
              "price": double.parse(priceController.text),
              "image_url": imageUrl,
              "category_id": widget.categoryID,
            },
          ).then(
            (value) {
              setState(() {
                isLoading = false;
                AwesomeDialogClass.Successful(
                    context,
                    "Product is added successfully",
                    Products(widget.categoryID, widget.categoryName));
              });
            },
          ); */
        }
      },
      child: new Container(
        margin: EdgeInsets.all(15),
        height: AnimationTranstion.uzunlukFonksiyonu(40, context),
        width: AnimationTranstion.genislikFonksiyonu(152, context),
        decoration: BoxDecoration(
          color: Color(0xff329D9C),
          borderRadius: BorderRadius.circular(6.00),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: new Text(
            "Add Product",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
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
      Icon icon_exp, TextInputType type, int maxLines) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: ValueKey(Baslik.toString()),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter a $Baslik";
          }
          return null;
        },
        maxLines: maxLines,
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
          EkleVeyaSil("Choose One of These",
              "Add a new image or delete this one?", context, DialogType.INFO);
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
      btnCancelText: "Add one more",
      btnCancelIcon: Icons.photo_camera,
      btnOkIcon: Icons.delete_sweep,
      btnCancelColor: Colors.grey,
      btnOkColor: Colors.grey,
      btnOkText: "Delete this one",
      btnCancelOnPress: () {
        CameravsGallery("From where?", "", context, DialogType.INFO);
      },
      btnOkOnPress: () {
        SonKararMi("Sure?", "Delete this image?", context, DialogType.WARNING);
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
      btnCancelText: "Camera",
      btnCancelIcon: Icons.photo_camera,
      btnOkIcon: Icons.photo,
      btnCancelColor: Colors.grey,
      btnOkColor: Colors.grey,
      btnOkText: "Gallery",
      btnCancelOnPress: () {
        getImagefromCamera();
      },
      btnOkOnPress: () {
        getImageFromGallery();
      },
    )..show();
  }

  Future getImagefromCamera() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
    );

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
      btnCancelText: "Cancel",
      btnCancelIcon: Icons.cancel,
      btnOkIcon: Icons.delete_forever,
      btnCancelColor: Colors.grey,
      btnOkColor: Colors.grey,
      btnOkText: "Yes",
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
