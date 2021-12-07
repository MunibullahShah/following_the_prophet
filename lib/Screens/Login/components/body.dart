import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:following_the_prophet/Screens/Login/components/background.dart';
import 'package:following_the_prophet/Screens/Signup/signup_screen.dart';
import 'package:following_the_prophet/appbar.dart';
import 'package:following_the_prophet/components/already_have_an_account_acheck.dart';
import 'package:following_the_prophet/components/rounded_button.dart';
import 'package:following_the_prophet/components/rounded_input_field.dart';
import 'package:following_the_prophet/components/rounded_password_field.dart';
import 'package:following_the_prophet/helper/database.dart';
import 'package:following_the_prophet/helper/firebaseAuth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var _prefs = SharedPreferences.getInstance();

  Firebase_Auth _firebase_auth = Firebase_Auth();
  Database _db = Database();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Background(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    controller: emailController,
                    hintText: "Your Email",
                  ),
                  RoundedPasswordField(
                    controller: passwordController,
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    press: () {
                      _signIn();
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
  }

  // Future<void> _incrementCounter() async {
  //   final SharedPreferences prefs = await _prefs;
  //   prefs.setInt('counter', );
  // }

  void _signIn() async {
    SharedPreferences prefs = await _prefs;

    setState(() {
      loading = true;
    });
    await _firebase_auth
        .signInWithEmail(emailController.text, passwordController.text)
        .then(
      (value) async {
        if (value != null) {
          try {
            String username = await _db.getUsername(emailController.text);
            prefs.setString('username', username);
          } catch (e) {
            print(e);
          }

          loading = false;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyAppBar()));
        } else {
          Fluttertoast.showToast(msg: 'Couldn\'t sign in');
          loading = !loading;
        }
      },
    );
  }
}
