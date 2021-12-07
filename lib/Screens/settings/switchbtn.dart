import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchButton extends StatefulWidget {
  

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {bool status = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterSwitch(
            width: 80.0,
            height: 30.0,
            valueFontSize: 10.0,
            toggleSize: 20.0,
            value: status,
            borderRadius: 30.0,
            padding: 8.0,
            showOnOff: true,
            onToggle: (val) {
              setState(() {
                status = val;
              });
    
  }
    ));
}
}