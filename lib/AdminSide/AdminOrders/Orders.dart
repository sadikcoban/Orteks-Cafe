import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarAdmin.dart';
import 'package:MobilProject/classes/api_customer.dart';
import 'package:MobilProject/classes/api_person.dart';
import 'package:MobilProject/classes/api_product.dart';
import 'package:MobilProject/services/service_reqs.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int currentIndex = 0;

  fetchDatas() async {
    List<ApiPerson> customerList = await ServiceReqs().getCustomers();
    List<ApiProduct> productList =
        await ServiceReqs().getProductsOfCategory("Cocoa");
    var list = [customerList, productList];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [OrdersBody(), TableBody()];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(),
      drawer: NaavigationBarAdmin(),
      appBar: ApplicationBar(
          Colors.white,
          Color(0xff329D9C),
          currentIndex == 0 ? "Orders" : "Tables",
          Color(0xff329D9C),
          RefreshButton()),
      body: tabs[currentIndex],
    );
  }

  RefreshButton() {
    return IconButton(
        icon: Icon(
          Icons.refresh,
          color: Color(0xff329D9C),
        ),
        onPressed: null);
  }

  OrdersBody() {
    return FutureBuilder(
        future: fetchDatas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("An error occured, please try again"),
            );
          }
          if (snapshot.hasData) {
            List<ApiPerson> customerList = snapshot.data[0];
            List<ApiProduct> productList = snapshot.data[1];
            productList.forEach((e) {
              print(e.name);
            });

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => ExpandedCardforOrders(
                      context,
                      index,
                      customerList[index].name,
                      (int.tryParse(customerList[index].productNum) ?? 2) % 5,
                      productList,
                    ),
                    itemCount: customerList.length,
                  ),
                ),
              ],
            );
          }
        });
  }

  TableBody() {
    return new GridView.count(
      primary: true,
      crossAxisCount: 2,
      childAspectRatio: 0.80,
      children: List.generate(15, (index) {
        return TableCard(index);
      }),
    );
  }

  TableCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
          elevation: 15,
          shadowColor: Colors.black,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text("${index + 1}",
                      style: GoogleFonts.montserrat(
                        color: index % 3 == 0 ? Colors.red : Colors.green,
                      )),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListTile(
                  title: index % 3 == 0
                      ? Center(
                          child: Container(
                              width: 50,
                              child: Row(
                                children: [
                                  Text(
                                    "15",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.red),
                                  ),
                                  Icon(Icons.timer)
                                ],
                              )),
                        )
                      : SizedBox(),
                ),
              ),
            ],
          )),
    );
  }

  ExpandedCardforOrders(BuildContext context, int index, String custName,
      int orderNum, List<ApiProduct> orders) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ExpansionTileCard(
        elevation: 15,
        initialElevation: 15,
        shadowColor: Colors.black,
        title: Text(custName, style: GoogleFonts.montserrat()),
        leading:
            Text("11", style: GoogleFonts.montserrat(color: Color(0xff327D9D))),
        trailing: Container(
            width: 50,
            child: Row(
              children: [
                Text(
                  "15",
                  style: GoogleFonts.montserrat(color: Colors.red),
                ),
                Icon(Icons.timer)
              ],
            )),
        children: [
          Column(
            children: [
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: orderNum,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: AutoSizeText(
                        orders[index].name,
                        maxLines: 2,
                        style: GoogleFonts.montserrat(),
                      ),
                      subtitle: AutoSizeText(
                        "",
                        maxLines: 2,
                        style: GoogleFonts.montserrat(),
                      ),
                      trailing: Icon(
                        Icons.check_box,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  BottomNavigationBar() {
    return CurvedNavigationBar(
      backgroundColor: Color(0xff329D9C),
      items: <Widget>[
        AnimationTranstion.Avatar(
            "order", Colors.black, BoxFit.scaleDown, 30, 30),
        AnimationTranstion.Avatar(
            "dining-table", Colors.black, BoxFit.scaleDown, 30, 30),
      ],
      onTap: (index) {
        setState(() {
          currentIndex = index;
          print(currentIndex);
        });
      },
    );
  }
}
