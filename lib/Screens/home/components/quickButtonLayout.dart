import 'package:flutter/material.dart';
import 'package:following_the_prophet/Screens/home/components/hijrath_screen.dart';
import 'package:following_the_prophet/Screens/home/components/madniLife_screen.dart';
import 'package:following_the_prophet/Screens/home/components/makkiLife_screen.dart';
import 'package:following_the_prophet/Screens/home/components/wars_screen.dart';

class ButtonLayout extends StatelessWidget {
  Map<String, dynamic> routes = {
    "WARS": Wars(),
    "HIJRAT": Hijrath(),
    "MADANI LIFE": MadniLife(),
    "MAKKI LIFE": MakkiLife(),
  };

  ButtonLayout({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => routes[text],
            ));
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(5, 3, 5, 3),
            child: Center(child: Text(text)),
            //margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Color(0xFF9BBB94),
            ),
            height: 60,
            width: 90,
          ),
        ),
      ),
    );
  }
}
