import 'package:flutter/material.dart';

class DailyEvent extends StatelessWidget {
  DailyEvent({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Text(text),
         margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color(0xFF9BBB94),
        ),
         height: 140,
        width: 200,
      ),
    );
  }
}
