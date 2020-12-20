import 'package:MobilProject/MainPage/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class AnimationTranstion {
  // Aşağıdan Yukarıya Geçen Animasyondur.
  static AnimationPushWidget_DownToUp(
      Widget CurrentPage, BuildContext context) {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.downToUp, child: CurrentPage));
  }

  // Yukarıdan Aşağıya Geçen Animasyondur.
  static AnimationPushWidget_UptoDown(
      Widget CurrentPage, BuildContext context) {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.downToUp, child: CurrentPage));
  }

  // Soldan Sağa Geçen Animasyondur.
  static AnimationPushWidget_LeftToRight(
      Widget CurrentPage, BuildContext context) {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.downToUp, child: CurrentPage));
  }

  // Sağdan Sola Geçen Animasyondur.
  static AnimationPushWidget_RightToLeft(
      Widget CurrentPage, BuildContext context) {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.downToUp, child: CurrentPage));
  }

  static uzunlukFonksiyonu(double sayi, BuildContext context) {
    double heightXiaomi = 803.6363636363636;
    double uzunluk =
        (sayi * (MediaQuery.of(context).size.height)) / heightXiaomi;
    return uzunluk;
  }

  static genislikFonksiyonu(double sayi, BuildContext context) {
    double widthXiaomi = 392.72727272727275;
    double genislik =
        (sayi * (MediaQuery.of(context).size.width)) / widthXiaomi;
    return genislik;
  }

  static Avatar(
      String adress, Color color, BoxFit fit, double height, double width) {
    final String assetName = "images/" + adress + ".svg";
    final Widget svg = SvgPicture.asset(
      assetName,
      color: color,
      fit: fit,
    );
    return new Container(
      height: height,
      width: width,
      child: svg,
    );
  }

  static LogOut(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.logout,
        color: Colors.red[900],
      ),
      onPressed: () async {
       // await FirebaseAuth.instance.signOut();
        AnimationTranstion.AnimationPushWidget_RightToLeft(MainPage(), context);
      },
    );
  }

  static AvatarWithoutColor(
      String adress, BoxFit fit, double height, double width) {
    final String assetName = "images/" + adress + ".svg";
    final Widget svg = SvgPicture.asset(
      assetName,
      fit: fit,
    );
    return new Container(
      height: height,
      width: width,
      child: svg,
    );
  }
}
