import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../App-Navigation-Loading/AnimationTransition.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController MailController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();

  bool _isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: ApplicationBar(
          Colors.white, Colors.white, "Login", Color(0xff329D9C), SizedBox()),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldContainer(MailController, 80, "email",
                    Icon(Icons.person), TextInputType.emailAddress, false),
                TextFieldContainer(PasswordController, 80, "password",
                    Icon(Icons.person), TextInputType.visiblePassword, true),
                ButtonStyleLogin(context),
              ],
            ),
    );
  }

  ButtonStyleLogin(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isLoading = true;
        });
        /*  AuthService authService = new AuthService();
        authService.signIn(MailController.text, PasswordController.text).then((value) {
          setState(() {
            _isLoading = false;
          });
          if(value.role == 0){
             AnimationTranstion.AnimationPushWidget_DownToUp(
              CustomerMainPage(), context);
          }
          else if(value.role == 1){
              AnimationTranstion.AnimationPushWidget_DownToUp(
              WaiterMainPage(), context);
          }
          else if(value.role == 2){
              AnimationTranstion.AnimationPushWidget_DownToUp(
              AdminHomePage(), context);
          }
          else {
            AwesomeDialogClass.GeneralError(context);
          }
           
        }).catchError((e){
          setState(() {
            _isLoading = false;
          });
           _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(e),
              backgroundColor: Colors.red,
            ),
          );

        });
        */
      },
      child: new Container(
        height: AnimationTranstion.uzunlukFonksiyonu(40, context),
        width: AnimationTranstion.genislikFonksiyonu(152, context),
        decoration: BoxDecoration(
          color: Color(0xff329D9C),
          borderRadius: BorderRadius.circular(6.00),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: new Text(
            "Log in",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }

  TextFieldContainer(TextEditingController controller, int limit, String Baslik,
      Icon icon_exp, TextInputType type, bool obscure) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        obscureText: obscure,
        controller: controller,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: new InputDecoration(
          focusColor: Color(0xff329D9C),
          focusedBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Color(0xff329D9C))),
          enabledBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Color(0xff329D9C))),
          filled: true,
          prefixIcon: icon_exp,
          fillColor: Colors.white,
          labelText: Baslik,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        keyboardType: type,
      ),
    );
  }
}
