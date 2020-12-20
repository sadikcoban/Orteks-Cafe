import 'dart:math';

import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarAdmin.dart';
import 'package:MobilProject/classes/api_person.dart';
import 'package:MobilProject/classes/api_product.dart';
import 'package:MobilProject/services/service_reqs.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class Statistics extends StatelessWidget {
  final Map<String, double> BestPersonelsT = {
    'Sadik': 5,
    'Arif': 10,
    'Ziya': 9,
    'Salih': 7,
    'Balık': 12,
  };
  final Map<String, double> BestPersonelsM = {
    'Ziya': 5,
    'Balik': 11,
    'Sadik': 9,
    'Salih': 6,
    'Arif': 7,
  };
  final Map<String, double> BestPersonelsY = {
    'Sadik': 7,
    'Arif': 8,
    'Ziya': 16,
    'Salih': 4,
    'Balık': 8,
  };
  final Map<String, double> HighestSellingProductsT = {
    'Filtre Kahve': 9,
    'Latte': 5,
    'Mocha': 6,
    'Americano': 4,
    'Sıcak Çikolata': 9,
  };
  final Map<String, double> HighestSellingProductsM = {
    'Fındıklı Kurabiye': 8,
    'Latte': 7,
    'Mocha': 5,
    'Americano': 5,
    'Filtre Kahve': 3,
  };
  final Map<String, double> HighestSellingProductsY = {
    'Su': 12,
    'Latte': 5,
    'Çay': 16,
    'Americano': 5,
    'Sıcak Çikolata': 7,
  };
  final Map<String, double> LowestSellingProductsT = {
    'Cold Brew': 4,
    'Muzlu Frappe': 8,
    'Limonata': 5,
    'Süt': 5,
    'Melengiç Kahvesi': 7,
  };
  final Map<String, double> LowestSellingProductsM = {
    'Türk Kahvesi': 1,
    'Latte': 5,
    'Efe Kahvesi': 6,
    'Americano': 5,
    'Limonata': 9,
  };
  final Map<String, double> LowestSellingProductsY = {
    'Türk Kahvesi': 12,
    'Limonata': 7,
    'sahlep': 14,
    'Efe Kahvesi': 10,
    'Muzlu Frapp': 9,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(Colors.white, Color(0xff329D9C), "Statistics",
          Color(0xff329D9C), SizedBox()),
      drawer: NaavigationBarAdmin(),
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              FutureBuilder(
                future: ServiceReqs().getCrew(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ApiPerson> personlist = snapshot.data;

                    var myList = personlist.take(5);
                    var dailyMap = Map.fromIterable(myList,
                        key: (e) => e.name.toString(),
                        value: (e) => double.parse(e.productNum));
                    var monthlyMap = Map.fromIterable(myList,
                        key: (e) => e.name.toString(),
                        value: (e) => double.parse(e.customerNum));
                    var annulMap = Map.fromIterable(
                      myList,
                      key: (e) => e.name.toString(),
                      value: (e) =>
                          ((int.parse(e.productNum) + int.parse(e.customerNum))
                              .toDouble()),
                    );
                    return CardItem(
                      dailyMap,
                      monthlyMap,
                      annulMap,
                      "The Most Working Staff",
                      context,
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              FutureBuilder(
                future: ServiceReqs().getProductsOfCategory("Cocktail"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ApiProduct> productlist = snapshot.data;

                    var myList = productlist.take(5);
                    var dailyMap = Map.fromIterable(myList,
                        key: (e) => e.name.toString(),
                        value: (e) => (double.parse(e.id) % 20).toDouble());
                    myList = productlist.getRange(5, 10);
                    var monthlyMap = Map.fromIterable(myList,
                        key: (e) => e.name.toString(),
                        value: (e) => (double.parse(e.id) % 30).toDouble());
                    myList = productlist.getRange(10, 15);
                    var annulMap = Map.fromIterable(
                      myList,
                      key: (e) => e.name.toString(),
                      value: (e) => (double.parse(e.id) % 40).toDouble(),
                    );
                    return CardItem(
                      dailyMap,
                      monthlyMap,
                      annulMap,
                      "Most Sold Products",
                      context,
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              FutureBuilder(
                future: ServiceReqs().getProductsOfCategory("Ordinary_Drink"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ApiProduct> productlist = snapshot.data;

                    var myList = productlist.take(5);
                    var dailyMap = Map.fromIterable(myList,
                        key: (e) => e.name.toString(),
                        value: (e) => (double.parse(e.id) % 20).toDouble());
                    myList = productlist.getRange(5, 10);
                    var monthlyMap = Map.fromIterable(myList,
                        key: (e) => e.name.toString(),
                        value: (e) => (double.parse(e.id) % 30).toDouble());
                    myList = productlist.getRange(10, 15);
                    var annulMap = Map.fromIterable(
                      myList,
                      key: (e) => e.name.toString(),
                      value: (e) => (double.parse(e.id) % 40).toDouble(),
                    );
                    return CardItem(
                      dailyMap,
                      monthlyMap,
                      annulMap,
                      "Less Sold Products",
                      context,
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ],
          )
        ],
      )),
    );
  }

  CardItem(Map<String, double> Today, Map<String, double> Month,
      Map<String, double> Year, String Header, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ExpansionTileCard(
        elevation: 15,
        initialElevation: 15,
        shadowColor: Colors.black,
        title: Text(Header,
            style: GoogleFonts.montserrat(
              color: Color(0xff329D9C),
            )),
        children: [
          GeneralHeader("Daily"),
          SizedBox(height: 15),
          PieChartItem(Today, context),
          SizedBox(height: 15),
          GeneralHeader("Monthly"),
          SizedBox(height: 15),
          PieChartItem(Month, context),
          SizedBox(height: 15),
          GeneralHeader("Anually"),
          SizedBox(height: 15),
          PieChartItem(Year, context),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  GeneralHeader(String StatisticName) {
    return new Text(
      StatisticName,
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
          color: Color(0xff329D9C), fontWeight: FontWeight.w700),
    );
  }

  PieChartItem(Map<String, double> GeneralItem, BuildContext context) {
    return PieChart(
      dataMap: GeneralItem,
      chartLegendSpacing: 15,
      animationDuration: Duration(milliseconds: 800),
      chartRadius: MediaQuery.of(context).size.width / 2.2,
      showChartValuesInPercentage: true,
      showChartValues: true,
      showChartValuesOutside: true,
      chartValueBackgroundColor: Colors.grey[200],
      showLegends: true,
      legendPosition: LegendPosition.right,
      decimalPlaces: 1,
      showChartValueLabel: true,
      chartType: ChartType.disc,
    );
  }
}
