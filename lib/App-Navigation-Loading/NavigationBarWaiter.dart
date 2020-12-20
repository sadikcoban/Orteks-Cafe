
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/MainPage/MainPage.dart';
import 'package:MobilProject/WaiterSide/OrdersWaiter.dart';
import 'package:MobilProject/WaiterSide/PrepareOrdersWaiter.dart';
import 'package:MobilProject/WaiterSide/WaiterMainPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AnimationTransition.dart';

class NavigationBarWaiter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
      width: 200,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Center(
              child: AnimationTranstion.Avatar(
                  "waiter", Color(0xff329D9C), BoxFit.contain, 70, 70),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text(
                "AnaSayfa",//
                style: GoogleFonts.montserrat(
                  color: Color(0xff329D9C),
                ),
              ),
              leading: Icon(
                Icons.home,
                color: Color(0xff329D9C),
              ),
              onTap: () {
                AnimationTranstion.AnimationPushWidget_LeftToRight(
                    WaiterMainPage(), context);
              },
            ),
            ListTile(
              title: Text(
                "Siparişler",
                style: GoogleFonts.montserrat(
                  color: Color(0xff329D9C),
                ),
              ),
              leading: Icon(
                Icons.add_shopping_cart,
                color: Color(0xff329D9C),
              ),
              onTap: () =>AnimationTranstion.AnimationPushWidget_DownToUp(OrdersWaiter(), context),
            ),
             ListTile(
              title: Text(
                "Hazırlanacaklar",
                style: GoogleFonts.montserrat(
                  color: Color(0xff329D9C),
                ),
              ),
              leading: Icon(
                Icons.food_bank_outlined,
                color: Color(0xff329D9C),
              ),
              onTap: () =>AnimationTranstion.AnimationPushWidget_DownToUp(PrepareOrdersWaiter(), context),
            ),
             ListTile(
              title: Text(
                "Çıkış Yap",
                style: GoogleFonts.montserrat(
                  color: Colors.red,
                ),
              ),
              leading: Icon(
                Icons.call_missed_outlined,
                color: Colors.red,
              ),
              onTap: () => AnimationTranstion.AnimationPushWidget_LeftToRight(
                    MainPage(), context),
            ),
          ],
        ),
      ),
    );
  }
}