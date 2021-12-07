import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * (65),
        height: 30.0,
        child: TextField(
          decoration: new InputDecoration(
            icon: new Icon(Icons.search),
            labelText: 'Search',
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
