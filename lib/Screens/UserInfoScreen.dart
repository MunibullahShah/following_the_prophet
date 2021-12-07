import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:following_the_prophet/appbar.dart';
import 'package:following_the_prophet/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoScreen extends StatelessWidget {
  final UserModel user;

  UserInfoScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (item) => handleClick(context),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Logout')),
              ],
            ),
          ],
          title: Text(
            "Signed In",
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "UserName: ",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    user.username,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Email: ",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(
                      fontSize: 18,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  handleClick(BuildContext context) async {
    FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyAppBar()));
  }
}
