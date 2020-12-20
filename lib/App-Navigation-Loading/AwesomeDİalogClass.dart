
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AwesomeDialogClass{

  static SpecialError(BuildContext context, String desc) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: "Unsuccessful",
      desc: desc,
      btnOkText: "Go Back",
      btnOkColor: Colors.red,
      btnOkOnPress: () {
      },
    )..show();
  }

   static GeneralError(BuildContext context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: "Something went wrong:(",
      desc: "Please try again",
      btnOkText: "OK",
      btnOkColor: Colors.red,
      btnOkOnPress: () {
      },
    )..show();
  }


   static Successful(BuildContext context, String desc, Widget routeWidget) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: "Successful",
      desc: desc,
      btnOkText: "OK",
      btnOkColor: Colors.green,
      btnOkOnPress: () {
        AnimationTranstion.AnimationPushWidget_DownToUp(routeWidget, context);
      },
    )..show();
  }
}