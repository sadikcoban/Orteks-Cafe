
import 'package:MobilProject/App-Navigation-Loading/AnimationTransition.dart';
import 'package:MobilProject/App-Navigation-Loading/ApplicationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController MailCOntroller = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  TextEditingController NameController = new TextEditingController();
  TextEditingController SurnameController = new TextEditingController();
  TextEditingController PhoneController = new TextEditingController();
  bool _isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: ApplicationBar(
          Colors.white, Colors.white, "Sign UP", Color(0xff329D9C), SizedBox()),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: AnimationTranstion.uzunlukFonksiyonu(60, context),
                ),
                SizedBox(
                  height: AnimationTranstion.uzunlukFonksiyonu(10, context),
                ),
                TextFieldContainerSurname(NameController, 20, "name",
                    new Icon(Icons.supervised_user_circle), context, false),
                SizedBox(
                  height: AnimationTranstion.uzunlukFonksiyonu(15, context),
                ),
                SizedBox(
                  height: AnimationTranstion.uzunlukFonksiyonu(10, context),
                ),
                TextFieldContainerSurname(SurnameController, 20, "surname ",
                    new Icon(Icons.supervised_user_circle), context, false),
                SizedBox(
                  height: AnimationTranstion.uzunlukFonksiyonu(15, context),
                ),
                SizedBox(
                  height: AnimationTranstion.uzunlukFonksiyonu(10, context),
                ),
                TextFieldContainerPhone(PhoneController, 10, "XXX XXX XX XX  ",
                    new Icon(Icons.phone), context),
                SizedBox(
                  height: AnimationTranstion.uzunlukFonksiyonu(15, context),
                ),
                TextFieldContainerSurname(MailCOntroller, 20, "email",
                    new Icon(Icons.email), context, false),
                SizedBox(
                  height: AnimationTranstion.uzunlukFonksiyonu(15, context),
                ),
                TextFieldContainerSurname(PasswordController, 20, "password",
                    new Icon(Icons.remove_red_eye), context, true),
                SizedBox(
                  height: AnimationTranstion.uzunlukFonksiyonu(15, context),
                ),
                ButtonStyleSignUp(context)
              ],
            ),
    );
  }

  ButtonStyleSignUp(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        /* setState(() {
          _isLoading = true;
        });
        FocusScope.of(context).unfocus();
        AuthService authService = new AuthService();
        authService
            .signupCustomer(
                MailCOntroller.text,
                PasswordController.text,
                NameController.text,
                SurnameController.text,
                PhoneController.text)
            .then((result) {
          setState(() {
            _isLoading = false;
          });
          if (result == null) {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text("Sign up successful. Please login"),
                backgroundColor: Colors.green,
              ),
            );
            AwesomeDialogClass.Successful(
                context, "Sign up is successful! Press OK to Login", Login());
          } else {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text(result),
                backgroundColor: Colors.red,
              ),
            );
          }
        }).catchError((e) {
          setState(() {
            _isLoading = false;
          });
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(e),
              backgroundColor: Colors.red,
            ),
          );
        }); */
      },
      child: Align(
        child: new Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            color: Color(0xff327D9D),
            borderRadius: BorderRadius.circular(6.00),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: new Text(
              "Sign UP",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  TextFieldContainerSurname(TextEditingController controller, int limit,
      String Baslik, Icon icon_exp, BuildContext context, bool obscure) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Container(
        height: AnimationTranstion.uzunlukFonksiyonu(50, context),
        width: AnimationTranstion.genislikFonksiyonu(360, context),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          border: Border.all(
            width: 2.00,
            color: Color(0xff329D9C),
          ),
          borderRadius: BorderRadius.circular(15.00),
        ),
        child: Center(
          child: TextField(
            obscureText: obscure,
            inputFormatters: [
              LengthLimitingTextInputFormatter(limit),
            ],
            maxLines: 1,
            controller: controller,
            decoration: InputDecoration(
                icon: icon_exp, border: InputBorder.none, hintText: Baslik),
          ),
        ),
      ),
    );
  }

  TextFieldContainerPhone(TextEditingController controller, int limit,
      String Baslik, Icon icon_exp, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Container(
        height: AnimationTranstion.uzunlukFonksiyonu(40, context),
        width: AnimationTranstion.genislikFonksiyonu(360, context),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          border: Border.all(
            width: 2.00,
            color: Color(0xff329D9C),
          ),
          borderRadius: BorderRadius.circular(15.00),
        ),
        child: Center(
          child: TextField(
            keyboardType: TextInputType.phone,
            inputFormatters: [
              LengthLimitingTextInputFormatter(limit),
            ],
            controller: controller,
            decoration: InputDecoration(
                prefix: Text(
                  "+90 ",
                  style: GoogleFonts.montserrat(),
                ),
                icon: icon_exp,
                border: InputBorder.none,
                hintText: Baslik),
          ),
        ),
      ),
    );
  }
}
