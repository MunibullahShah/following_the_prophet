
import 'package:flutter/material.dart';

class DropDownBtn extends StatefulWidget {
  

  @override
  _DropDownBtnState createState() => _DropDownBtnState();
}
int _value = 1;
class _DropDownBtnState extends State<DropDownBtn> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      borderRadius: BorderRadius.circular(20),
      dropdownColor: Colors.white,
    style: TextStyle(
      color: Colors.black,
      backgroundColor: Colors.green[50],),
              value: _value,
              items: [
                DropdownMenuItem(
                  
                  child: Text("First Item"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Second Item"),
                  value: 2,
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              })
        ;
  }
}