import 'package:flutter/material.dart';
import 'package:following_the_prophet/Screens/Login/login_screen.dart';
import 'package:following_the_prophet/Screens/UserInfoScreen.dart';
import 'package:following_the_prophet/Screens/favorite/favorite_page.dart';
import 'package:following_the_prophet/Screens/home/components/quickButton.dart';
import 'package:following_the_prophet/Screens/menu/menu.dart';
import 'package:following_the_prophet/helper/database.dart';
import 'package:following_the_prophet/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/home/components/calender.dart';
import 'Screens/home/components/dailyEent.dart';
import 'Screens/settings/settings.dart';
import 'constant.dart';

class MyAppBar extends StatefulWidget {
  @override
  _MyAppBar createState() => _MyAppBar();
}

class _MyAppBar extends State<MyAppBar> {
  var _prefs = SharedPreferences.getInstance();
  Database _db = Database();

  UserModel userdata = UserModel();

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              color: kHomeColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QuickButton(),
                  Calender(),
                  Row(
                    children: [
                      DailyEvent(
                        text: 'Today\'s Event',
                      ),
                      DailyEvent(
                        text: 'Today\'s Hadith',
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return FavoritePage(user: userdata);
                                },
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SettingScreen();
                                },
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.settings,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: NavigationMenu(),
        appBar: AppBar(
            title: Center(
              child: Text(
                'FOLLOWING THE PROPHET',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFFD9727),
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {
                  getUserData();
                  if (userdata.username == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UserInfoScreen(userdata);
                        },
                      ),
                    );
                  }
                },
              ),
            ]),
      ),
    );
  }

  getUserData() async {
    SharedPreferences prefs = await _prefs;
    var username = prefs.getString('username');
    print("USerName $username");
    if (username != null) {
      var dbData = await _db.getUserData(username);
      print("DBDATA: " + dbData.toString());
      userdata = UserModel(
          username: dbData['username'],
          email: dbData['email'],
          lastRead: dbData['lastRead'],
          favorite: dbData['favorite']);
    }
  }
}
