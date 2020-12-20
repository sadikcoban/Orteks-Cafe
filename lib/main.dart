import 'package:MobilProject/App-Navigation-Loading/AwesomeD%C4%B0alogClass.dart';
import 'package:flutter/material.dart';
import 'AdminSide/AdminHomePage/AdminHomePage.dart';
import 'App-Navigation-Loading/AnimationTransition.dart';
import 'CustomerSide/CustomerMainPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    theme: new ThemeData(
      canvasColor: Colors.white,
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int curStatus = -2;
  @override
  void initState() {
   // checkToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomerMainPage()
                  
    );
  }

  /* Future<Widget> checkToken() async {
    FirebaseAuth.instance.authStateChanges().listen((User user) async {
      if (user == null) {
        setState(() {
          curStatus = -1;
        });
      } else {
        var myUser = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();

        if (myUser["role"] == 0) {
          setState(() {
            curStatus = 0;
          });
        } else if (myUser["role"] == 1) {
          setState(() {
            curStatus = 1;
          });
        } else if (myUser["role"] == 2) {
          setState(() {
            curStatus = 2;
          });
        } else {
          AwesomeDialogClass.GeneralError(context);
        }
      }
    });
  } */
}
