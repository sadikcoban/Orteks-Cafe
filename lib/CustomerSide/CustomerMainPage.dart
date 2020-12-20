
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/CustomerSide/CreditCard.dart';
import 'package:MobilProject/CustomerSide/CustomerHome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Menu.dart';

class CustomerMainPage extends StatefulWidget {
  @override
  _CustomerMainPageState createState() => _CustomerMainPageState();
}

class _CustomerMainPageState extends State<CustomerMainPage> {
  final tabs = [CustomerHome(),Menu(),CreditCard()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(),
      body: tabs[currentIndex]
    );
  }

  BottomNavigationBar() {
    return CurvedNavigationBar(
      backgroundColor: Color(0xff329D9C),
      items: <Widget>[
        Icon(Icons.home),
        Icon(Icons.restaurant_menu_outlined),
        Icon(Icons.credit_card_outlined)
      ],
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
