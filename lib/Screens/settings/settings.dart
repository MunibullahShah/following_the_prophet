import 'package:flutter/material.dart';
import 'package:following_the_prophet/Screens/settings/dropdownbtn.dart';
import 'package:following_the_prophet/Screens/settings/switchbtn.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 20, color: Color(0xFFFD9727)),
            ),
          ),
        ),
        body: Container(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            buildSettingItem(
                text: 'Language',
                icon: Icons.language,
                postWidget: DropDownBtn(),
                width: MediaQuery.of(context).size.width-50,
              ),
               SizedBox(
                height: 5,
              ),
              buildSettingItem(
                text: 'Change Mode',
                icon: Icons.brightness_4,
                postWidget: SwitchButton(),
                 width: MediaQuery.of(context).size.width-50,
              ),
               SizedBox(
                height: 5,
              ),
              buildSettingItem(
                text: 'Font Size',
                icon: Icons.format_indent_decrease,
                postWidget: DropDownBtn(),
                width: MediaQuery.of(context).size.width-50,
              ),
               SizedBox(
                height: 5,
              ),
              buildSettingItem(
                text: 'Keep Screen On',
                icon: Icons.computer,
                postWidget: SwitchButton(),
                 width: MediaQuery.of(context).size.width-50,
              ),
               SizedBox(
                height: 5,
              ),
          ],)
        ),);
  }
}

Widget buildSettingItem({
  String text,
  IconData icon,
  Widget postWidget,
  double width,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white60;
  // return Container(
  //   width: width,
  //   height: 30,
  //   child:Row(children: [
  //     Icon(icon),
  //     SizedBox(
  //               width: 10,
  //             ),
  //   Text(
  //         text,
  //         style: TextStyle(color: color),
  //       ),
  //       SizedBox(
  //               width: 10,
  //             ),
  //       postWidget!=null?postWidget:Container(width: 0.1,height: 0.1,),
  //   ],),
  // );
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Row(
      children: [
        Text(
          text,
          style: TextStyle(color: color),
        ),
        SizedBox(width: 30,),
        postWidget!=null?postWidget:Container(width: 0.1,height: 0.1,),
      ],
    ),
    hoverColor: hoverColor,
  );
}
