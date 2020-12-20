
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/App-Navigation-Loading/NavigationBarAdmin.dart';
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
  final Map<String, double> BestPersonelsY ={
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
  final Map<String, double> LowestSellingProductsT ={
    'Cold Brew': 4,
    'Muzlu Frappe': 8,
    'Limonata': 5,
    'Süt': 5,
    'Melengiç Kahvesi': 7,
  };
  final Map<String, double> LowestSellingProductsM ={
    'Türk Kahvesi': 1,
    'Latte': 5,
    'Efe Kahvesi': 6,
    'Americano': 5,
    'Limonata': 9,
  };
  final Map<String, double> LowestSellingProductsY ={
    'Türk Kahvesi': 12,
    'Limonata': 7,
    'sahlep': 14,
    'Efe Kahvesi': 10,
    'Muzlu Frapp': 9,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(Colors.white, Color(0xff329D9C), "İSTATİSTİKLER",
          Color(0xff329D9C), SizedBox()),
      drawer: NaavigationBarAdmin(),
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              CardItem(BestPersonelsT, BestPersonelsM, BestPersonelsY,
                  "En Hızlı Çalışan Garsonlar", context),
              CardItem(HighestSellingProductsT, HighestSellingProductsM,
                  HighestSellingProductsY, "En Çok Satan Ürünler", context),
              CardItem(LowestSellingProductsT, LowestSellingProductsM,
                  LowestSellingProductsY, "En Az Satan Ürünler", context),
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
          GeneralHeader("GÜNLÜK"),
          SizedBox(height:15),
          PieChartItem(Today, context),
           SizedBox(height:15),
          GeneralHeader("AYLIK"),
           SizedBox(height:15),
          PieChartItem(Month, context),
           SizedBox(height:15),
          GeneralHeader("YILLIK"),
           SizedBox(height:15),
          PieChartItem(Year, context),
           SizedBox(height:15),
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
