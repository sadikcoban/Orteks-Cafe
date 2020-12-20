
import 'dart:ui';

import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/LoginSignUp/Login.dart';
import 'package:MobilProject/LoginSignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  double _sigmaX = 5.0;
  double _sigmaY = 3.0;
  double _opacity = 0.2;

  @override
  Widget build(BuildContext context) {
 return Scaffold(
   body: BackGroundImage(context),
 );
  }

  

  ButtonStyleLogin(BuildContext context) {
    return new Container(
      height: AnimationTranstion.uzunlukFonksiyonu(40, context),
      width: AnimationTranstion.genislikFonksiyonu(152, context),
      decoration: BoxDecoration(
        color: Color(0xff329D9C),
        borderRadius: BorderRadius.circular(6.00),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: new Text(
          "Login",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }

  ButtonStyleSignUp(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          AnimationTranstion.AnimationPushWidget_DownToUp(SignUp(), context),
      child: new Container(
        height: AnimationTranstion.uzunlukFonksiyonu(40, context),
        width: AnimationTranstion.genislikFonksiyonu(152, context),
        decoration: BoxDecoration(
          color: Color(0xff327D9D),
          borderRadius: BorderRadius.circular(6.00),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: new Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }

  BackGroundImage(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          AnimationTranstion.AnimationPushWidget_DownToUp(Login(), context),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Backgorund.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
          child: Container(
              color: Colors.black.withOpacity(_opacity),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(),
                  Center(
                    child: Text(
                      "ORTEKS CAFE",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Tamamen egzotik ve doğal aromalı kokusuyla sizi kahvenin içinde hissettirecek içeceklerimizle sizi bekliyoruz.Gününüzün enerjik geçmesi için bir kere orteks kahve için.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            color: Colors.white70,
                            fontWeight: FontWeight.w200,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonStyleSignUp(context),
                      ButtonStyleLogin(context)
                    ],
                  ),
                  SizedBox(),
                  SizedBox(),
                ],
              )),
        ),
      ),
    );
  }
}