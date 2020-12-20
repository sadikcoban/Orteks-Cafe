
import 'package:MobilProject/AdminSide/AdminHomePage/AdminHomePage.dart';
import 'package:MobilProject/AdminSide/AdminOrders/Orders.dart';
import 'package:MobilProject/AdminSide/PrepareOrders/PrepareOrders.dart';
import 'package:MobilProject/AdminSide/Products/Categories.dart';
import 'package:MobilProject/AdminSide/Staff/Staff.dart';
import 'package:MobilProject/AdminSide/Statistics/Statistics.dart';
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:MobilProject/MainPage/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NaavigationBarAdmin extends StatelessWidget {
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
                  "UserImage", Color(0xff329D9C), BoxFit.contain, 70, 70),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text(
                "Dashboard",
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
                    AdminHomePage(), context);
              },
            ),
            ListTile(
                title: Text(
                  "Menu",
                  style: GoogleFonts.montserrat(
                    color: Color(0xff329D9C),
                  ),
                ),
                leading: Icon(
                  Icons.emoji_food_beverage,
                  color: Color(0xff329D9C),
                ),
                onTap: () {
                  AnimationTranstion.AnimationPushWidget_LeftToRight(
                      Categories(), context);
                }),
            ListTile(
              title: Text(
                "Orders",
                style: GoogleFonts.montserrat(
                  color: Color(0xff329D9C),
                ),
              ),
              leading: Icon(
                Icons.add_shopping_cart,
                color: Color(0xff329D9C),
              ),
              onTap: () =>AnimationTranstion.AnimationPushWidget_DownToUp(Orders(), context),
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
              onTap: () =>AnimationTranstion.AnimationPushWidget_DownToUp(PrepareOrders(), context),
            ),
            ListTile(
              title: Text(
                "Crew",
                style: GoogleFonts.montserrat(
                  color: Color(0xff329D9C),
                ),
              ),
              leading: Icon(
                Icons.people,
                color: Color(0xff329D9C),
              ),
              onTap: () =>AnimationTranstion.AnimationPushWidget_DownToUp(Staff(), context),
            ),
            ListTile(
              title: Text(
                "Statistics",
                style: GoogleFonts.montserrat(
                  color: Color(0xff329D9C),
                ),
              ),
              leading: Icon(
                Icons.pie_chart,
                color: Color(0xff329D9C),
              ),
              onTap: () => AnimationTranstion.AnimationPushWidget_LeftToRight(
                    Statistics(), context),
            ),
             ListTile(
              title: Text(
                "Sign Out",
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
