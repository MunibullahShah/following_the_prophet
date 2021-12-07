import 'package:flutter/material.dart';
import 'package:following_the_prophet/Screens/home/components/calenderTop.dart';
import 'package:following_the_prophet/Screens/home/components/searchBar.dart';

class Calender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xFF787777),
      ),
      height: MediaQuery.of(context).size.height * (0.61),
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchBar(),
          CalenderTop(),
        ],
      ),
    );
  }
}
